# ------------------------------------------------------------------------------
# Resource records that are considered mostly static and tightly coupled to the zone.
# ------------------------------------------------------------------------------

resource "aws_route53_record" "root_CAA" {
  provider = aws.route53resourcechange

  name = aws_route53_zone.cyber_dhs_gov.name
  records = [
    "0 issue \"letsencrypt.org\"",
    "0 issue \"amazon.com\"",
    "0 issuewild \";\"",
    "0 iodef \"mailto:NCATSSecurity@hq.dhs.gov\"",
  ]
  ttl     = 300
  type    = "CAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Generation of the domain identity token and DKIM keys in SES.
# ------------------------------------------------------------------------------

resource "aws_ses_domain_identity" "cyhy_dhs_gov_identity" {
  provider = aws.route53resourcechange

  domain = aws_route53_zone.cyber_dhs_gov.name
}

resource "aws_ses_domain_dkim" "cyber_dhs_gov_dkim" {
  provider = aws.route53resourcechange

  domain = aws_ses_domain_identity.cyhy_dhs_gov_identity.domain
}

# It would be nice to add aws_sns_topic_subscription resources for the
# bounce and complaint email notifications below, but Terraform cannot
# support that because such subscriptions must be approved out of
# band.  See, for example, here:
# https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#email

# cyber.dhs.gov bounce SNS
resource "aws_sns_topic" "cyber_dhs_gov_bounce" {
  provider = aws.route53resourcechange

  name = "${replace(aws_route53_zone.cyber_dhs_gov.name, ".", "_")}bounce"
  tags = var.tags
}
resource "aws_ses_identity_notification_topic" "cyber_dhs_gov_bounce" {
  provider = aws.route53resourcechange

  identity                 = aws_ses_domain_identity.cyhy_dhs_gov_identity.domain
  include_original_headers = true
  notification_type        = "Bounce"
  topic_arn                = aws_sns_topic.cyber_dhs_gov_bounce.arn
}

# cyber.dhs.gov complaint SNS
resource "aws_sns_topic" "cyber_dhs_gov_complaint" {
  provider = aws.route53resourcechange

  name = "${replace(aws_route53_zone.cyber_dhs_gov.name, ".", "_")}complaint"
  tags = var.tags
}
resource "aws_ses_identity_notification_topic" "cyber_dhs_gov_complaint" {
  provider = aws.route53resourcechange

  identity                 = aws_ses_domain_identity.cyhy_dhs_gov_identity.domain
  include_original_headers = true
  notification_type        = "Complaint"
  topic_arn                = aws_sns_topic.cyber_dhs_gov_complaint.arn
}

# cyber.dhs.gov delivery SNS
resource "aws_sns_topic" "cyber_dhs_gov_delivery" {
  provider = aws.route53resourcechange

  name = "${replace(aws_route53_zone.cyber_dhs_gov.name, ".", "_")}delivery"
  tags = var.tags
}
resource "aws_ses_identity_notification_topic" "cyber_dhs_gov_delivery" {
  provider = aws.route53resourcechange

  identity                 = aws_ses_domain_identity.cyhy_dhs_gov_identity.domain
  include_original_headers = true
  notification_type        = "Delivery"
  topic_arn                = aws_sns_topic.cyber_dhs_gov_delivery.arn
}
resource "aws_sqs_queue" "cyber_dhs_gov_delivery" {
  provider = aws.route53resourcechange

  # This is one fortnight (14 days)
  message_retention_seconds = 60 * 60 * 24 * 14
  name                      = "${replace(aws_route53_zone.cyber_dhs_gov.name, ".", "_")}delivery"
  tags                      = var.tags
}
resource "aws_sns_topic_subscription" "cyber_dhs_gov_bounce" {
  provider = aws.route53resourcechange

  endpoint  = aws_sqs_queue.cyber_dhs_gov_delivery.arn
  protocol  = "sqs"
  topic_arn = aws_sns_topic.cyber_dhs_gov_delivery.arn
}

# ------------------------------------------------------------------------------
# Resource records for email routing and security for the zone root.
# ------------------------------------------------------------------------------

resource "aws_route53_record" "root_MX" {
  provider = aws.route53resourcechange

  name    = aws_route53_zone.cyber_dhs_gov.name
  records = ["10 inbound-smtp.us-east-1.amazonaws.com"]
  ttl     = 300
  type    = "MX"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "root_SPF" {
  provider = aws.route53resourcechange

  name    = aws_route53_zone.cyber_dhs_gov.name
  records = ["v=spf1 include:amazonses.com -all"]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "mail_MX" {
  provider = aws.route53resourcechange

  name    = "mail.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["10 feedback-smtp.us-east-1.amazonses.com"]
  ttl     = 300
  type    = "MX"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "mail_SPF" {
  provider = aws.route53resourcechange

  name    = "mail.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["v=spf1 include:amazonses.com -all"]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "_dmarc_TXT" {
  provider = aws.route53resourcechange

  name    = "_dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["v=DMARC1; p=reject; sp=reject; adkim=s; aspf=r; rua=mailto:reports@dmarc.cyber.dhs.gov; rf=afrf; pct=100; ri=86400"]
  ttl     = 1800
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "_amazonses_TXT" {
  provider = aws.route53resourcechange

  name    = "_amazonses.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [aws_ses_domain_identity.cyhy_dhs_gov_identity.verification_token]
  ttl     = 60
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "dkim_CNAME" {
  provider = aws.route53resourcechange

  for_each = toset(aws_ses_domain_dkim.cyber_dhs_gov_dkim.dkim_tokens)

  name    = "${each.key}._domainkey.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["${each.key}.dkim.amazonses.com"]
  ttl     = "600"
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
