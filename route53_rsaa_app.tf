# ------------------------------------------------------------------------------
# Resource records that support RSAA (Repository for Software Attestations and
# Artifacts)

# ------------------------------------------------------------------------------
# Development entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "rsaa_dev_CNAME" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name    = "dev.rsaa.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["rsaa-dev-674180318.us-gov-west-1.elb.amazonaws.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "rsaa_dev_piv_CNAME" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name    = "piv.dev.rsaa.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["rsaa-dev-piv-651272849.us-gov-west-1.elb.amazonaws.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "rsaa_dev_piv_acme_CNAME" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name    = "_5d486d2fb58d1753933f5edd460ed038.piv.dev.rsaa.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_80388937627154b2c177f7fc3643bcea.mhbtsbpdnt.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "rsaa_stage_CNAME" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name    = "staging.rsaa.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["rsaa-stage-955379685.us-gov-west-1.elb.amazonaws.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "rsaa_stage_piv_CNAME" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name    = "piv.staging.rsaa.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["rsaa-stage-piv-144377488.us-gov-west-1.elb.amazonaws.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "rsaa_stage_piv_acme_CNAME" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name    = "_538a512062a89ebf513e9357efcdc9d0.piv.staging.rsaa.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_c32d5316d612788d9e39a709ad19161a.mhbtsbpdnt.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
