# ------------------------------------------------------------------------------
# Resource records that support SADR

# ------------------------------------------------------------------------------
# Staging entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "sadr_stage_CNAME" {
  provider = aws.route53resourcechange
  name     = "staging.sadr.${aws_route53_zone.cyber_dhs_gov.name}"
  records  = ["sadr-stage-1940583289.us-gov-west-1.elb.amazonaws.com"]
  ttl      = 300
  type     = "CNAME"
  zone_id  = aws_route53_zone.cyber_dhs_gov.zone_id
}
