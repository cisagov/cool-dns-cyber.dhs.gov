# ------------------------------------------------------------------------------
# Resource records that support the Rules cloudfront endpoints and application.
# ------------------------------------------------------------------------------

# This record gives Amazon Certificate Manager permission to
# generate certificates for rules.ncats.cyber.dhs.gov
resource "aws_route53_record" "root_acm_rules_CNAME" {
  provider = aws.route53resourcechange

  name = "_724d852f42d6b10ed1c6ab4135301ef6.rules.ncats.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "_548e9cb4a195b3c2a5410a9ff88fcda3.acm-validations.aws",
  ]
  ttl     = 60
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "rules_ncats_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d35iq78wt3hgdh.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
  name    = "rules.ncats.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "rules_ncats_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d35iq78wt3hgdh.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
  name    = "rules.ncats.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
