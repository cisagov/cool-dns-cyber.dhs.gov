# ------------------------------------------------------------------------------
# Resource records that support RSAA (Repository for Software Attestations and
# Artifacts)

# ------------------------------------------------------------------------------
# Development entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "rsaa_dev_CNAME" {
  provider = aws.route53resourcechange
  name     = "dev.rsaa.${aws_route53_zone.cyber_dhs_gov.name}"
  records  = ["rsaa-dev-674180318.us-gov-west-1.elb.amazonaws.com"]
  ttl      = 300
  type     = "CNAME"
  zone_id  = aws_route53_zone.cyber_dhs_gov.zone_id
}
# ------------------------------------------------------------------------------
# Staging entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "rsaa_stage_CNAME" {
  provider = aws.route53resourcechange
  name     = "staging.rsaa.${aws_route53_zone.cyber_dhs_gov.name}"
  records  = ["rsaa-stage-955379685.us-gov-west-1.elb.amazonaws.com"]
  ttl      = 300
  type     = "CNAME"
  zone_id  = aws_route53_zone.cyber_dhs_gov.zone_id
}
