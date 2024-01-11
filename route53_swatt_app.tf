# ------------------------------------------------------------------------------
# Resource records that support SWATT

# ------------------------------------------------------------------------------
# Staging entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "swatt_stage_CNAME" {
  provider = aws.route53resourcechange
  name     = "staging.swatt.${aws_route53_zone.cyber_dhs_gov.name}"
  records  = ["swatt-stage-2051905077.us-gov-west-1.elb.amazonaws.com"]
  ttl      = 300
  type     = "CNAME"
  zone_id  = aws_route53_zone.cyber_dhs_gov.zone_id
}
