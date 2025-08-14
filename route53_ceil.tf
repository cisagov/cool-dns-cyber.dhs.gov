# ------------------------------------------------------------------------------
# Delegate ceil.cyber.dhs.gov to the public Route53 zone in the CEIL
# project's DNS account.
# ------------------------------------------------------------------------------

resource "aws_route53_record" "ceil_NS" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name = "ceil.cyber.dhs.gov"
  records = [
    "ns-1466.awsdns-55.org",
    "ns-877.awsdns-45.net",
    "ns-381.awsdns-47.com",
    "ns-1661.awsdns-15.co.uk",
  ]
  ttl     = 86400
  type    = "NS"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
