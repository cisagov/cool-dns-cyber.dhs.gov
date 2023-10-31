# ------------------------------------------------------------------------------
# Resource records that support SADR Production and Staging applications.
# ------------------------------------------------------------------------------
#---------------------------------------------------------------------------

resource "aws_route53_record" "sadr_stage_CNAME" {
  provider = aws.route53resourcechange
  name    = "staging.sadr.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["sadr-stage-1940583289.us-gov-west-1.elb.amazonaws.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "sadr_prod_CNAME" {
  provider = aws.route53resourcechange
  name    = "sadr.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["sadr-prod-873204138.us-gov-west-1.elb.amazonaws.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
