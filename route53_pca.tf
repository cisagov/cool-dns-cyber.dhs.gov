# ------------------------------------------------------------------------------
# Resource records that support the Continuous Phishing Campaign Assessment
# (Con-PCA) application.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Production
# ------------------------------------------------------------------------------

resource "aws_route53_record" "pca_production_NS" {
  provider = aws.route53resourcechange

  name    = data.terraform_remote_state.pca_production.outputs.hosted_zone_name
  ttl     = 86400
  type    = "NS"
  records = data.terraform_remote_state.pca_production.outputs.hosted_zone_name_servers
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging
# ------------------------------------------------------------------------------

resource "aws_route53_record" "pca_staging_NS" {
  provider = aws.route53resourcechange

  name    = data.terraform_remote_state.pca_staging.outputs.hosted_zone_name
  ttl     = 30
  type    = "NS"
  records = data.terraform_remote_state.pca_staging.outputs.hosted_zone_name_servers
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
