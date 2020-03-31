# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this file.
# ------------------------------------------------------------------------------
locals {
  dmarc_domain_name = "dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
}

# ------------------------------------------------------------------------------
# Generation of the domain identity token and DKIM keys in SES.
# ------------------------------------------------------------------------------

resource "aws_ses_domain_identity" "dmarc_identity" {
  provider = aws.route53resourcechange

  domain = local.dmarc_domain_name
}

resource "aws_ses_domain_dkim" "dmarc_dkim" {
  provider = aws.route53resourcechange

  domain = aws_ses_domain_identity.dmarc_identity.domain
}

# ------------------------------------------------------------------------------
# Resource records that support the DMARC application.
# ------------------------------------------------------------------------------

resource "aws_route53_record" "dmarc_MX" {
  provider = aws.route53resourcechange

  name    = local.dmarc_domain_name
  records = ["10 inbound-smtp.us-east-1.amazonaws.com"]
  ttl     = 1800
  type    = "MX"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "_amazonses_dmarc_TXT" {
  provider = aws.route53resourcechange

  name    = "_amazonses.${local.dmarc_domain_name}"
  records = ["${aws_ses_domain_identity.dmarc_identity.verification_token}"]
  ttl     = 60
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "wildcard_report_dmarc_TXT" {
  provider = aws.route53resourcechange

  name    = "*._report._dmarc.${local.dmarc_domain_name}"
  records = ["v=DMARC1"]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "dkim_dmarc_CNAME" {
  provider = aws.route53resourcechange

  count   = 3
  name    = "${element(aws_ses_domain_dkim.dmarc_dkim.dkim_tokens, count.index)}._domainkey.${local.dmarc_domain_name}"
  records = ["${element(aws_ses_domain_dkim.dmarc_dkim.dkim_tokens, count.index)}.dkim.amazonses.com"]
  ttl     = "600"
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
