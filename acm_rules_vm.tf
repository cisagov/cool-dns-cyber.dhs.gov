# ------------------------------------------------------------------------------
# Create an ACM certificate for rules.vm.cyber.dhs.gov.
# ------------------------------------------------------------------------------

resource "aws_acm_certificate" "rules" {
  provider = aws.acmresourcechange

  domain_name       = "rules.vm.cyber.dhs.gov"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}

# ------------------------------------------------------------------------------
# Create public DNS records containing validation information for the
# ACM certificate created above.
# ------------------------------------------------------------------------------

resource "aws_route53_record" "rules_certificate_validation" {
  provider = aws.route53resourcechange

  for_each = {
    for dvo in aws_acm_certificate.rules.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true

  depends_on = [aws_acm_certificate.rules]

  name    = each.value.name
  records = [each.value.record]
  ttl     = 60
  type    = each.value.type
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Validate the ACM certificate created above.
# ------------------------------------------------------------------------------

resource "aws_acm_certificate_validation" "rules" {
  provider = aws.acmresourcechange

  certificate_arn         = aws_acm_certificate.rules.arn
  validation_record_fqdns = [for record in aws_route53_record.rules_certificate_validation : record.fqdn]
}
