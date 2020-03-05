# ------------------------------------------------------------------------------
# Resource records that support Federalist site cloudfront endpoints and application.
# ------------------------------------------------------------------------------

resource "aws_route53_record" "root_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d3nie9z8rrasif.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
  name    = aws_route53_zone.cyber_dhs_gov.name
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "root_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d3nie9z8rrasif.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
  name    = aws_route53_zone.cyber_dhs_gov.name
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
