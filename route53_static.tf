# ------------------------------------------------------------------------------
# Static records
# ------------------------------------------------------------------------------

resource "aws_route53_record" "root_CAA" {
  provider = aws.resource_change_role

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
# Records for email routing and security.
# ------------------------------------------------------------------------------

resource "aws_route53_record" "root_MX" {
  provider = aws.resource_change_role

  name    = aws_route53_zone.cyber_dhs_gov.name
  records = ["10 inbound-smtp.us-east-1.amazonaws.com"]
  ttl     = 300
  type    = "MX"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "root_SPF" {
  provider = aws.resource_change_role

  name    = aws_route53_zone.cyber_dhs_gov.name
  records = ["v=spf1 include:amazonses.com -all"]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "mail_MX" {
  provider = aws.resource_change_role

  name    = "mail.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["10 feedback-smtp.us-east-1.amazonses.com"]
  ttl     = 300
  type    = "MX"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "mail_SPF" {
  provider = aws.resource_change_role

  name    = "mail.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["v=spf1 include:amazonses.com -all"]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "_dmarc_TXT" {
  provider = aws.resource_change_role

  name    = "_dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["v=DMARC1; p=reject; sp=reject; adkim=s; aspf=r; rua=mailto:reports@dmarc.cyber.dhs.gov; rf=afrf; pct=100; ri=86400"]
  ttl     = 1800
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "_amazonses_TXT" {
  provider = aws.resource_change_role

  name    = "_amazonses.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["tOxXTap6jGLn6/VnBnget7lrXW+TxZTyTdOhm8LbM/Y="]
  ttl     = 60
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
