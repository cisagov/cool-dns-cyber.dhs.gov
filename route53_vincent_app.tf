# ------------------------------------------------------------------------------
# Resource records that support VINCE-NT (Vulnerability Information and
# Coordination Environment - New Technology)

# ------------------------------------------------------------------------------
# Development entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "vincent_dev_CNAME" {
  provider = aws.route53resourcechange

  name    = "dev.vincent.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["dmm9ihx0h3npb.cloudfront.net"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "vincent_dev_cert_verify_CNAME" {
  provider = aws.route53resourcechange

  name    = "_21b5e6882ded3469340d1e8fa8fd20a4.dev.vincent.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_a3c44409a70b3bd17f97ef3ff3b831e5.djqtsrsxkq.acm-validations.aws"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}


# ------------------------------------------------------------------------------
# Staging entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "vincent_stage_CNAME" {
  provider = aws.route53resourcechange

  name    = "staging.vincent.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["vincent-stage-1522298475.us-gov-west-1.elb.amazonaws.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
