# ------------------------------------------------------------------------------
# Create the cool.cyber.dhs.gov zone.
# ------------------------------------------------------------------------------
resource "aws_route53_zone" "cool_cyber_dhs_gov" {
  provider = aws.dnsprovisionaccount

  name = terraform.workspace == "production" ? "cool.cyber.dhs.gov" : "${terraform.workspace}.cool.cyber.dhs.gov"
}

# ------------------------------------------------------------------------------
# Delegate cool.cyber.dhs.gov from the cyber.dhs.gov zone.
# ------------------------------------------------------------------------------
resource "aws_route53_record" "cool_NS" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name    = "cool.cyber.dhs.gov"
  records = aws_route53_zone.cool_cyber_dhs_gov.name_servers
  ttl     = 86400
  type    = "NS"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Delegate staging-a.cyber.dhs.gov from the cyber.dhs.gov zone.
#
# NOTE: The values below for the records attribute are the nameservers for the
# staging-a.cyber.dhs.gov zone and since they are not available until that zone
# is created, these values must be updated manually after that is done.
# ------------------------------------------------------------------------------
resource "aws_route53_record" "staging-a_NS" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name = "staging-a.cyber.dhs.gov"
  records = [
    "ns-747.awsdns-29.net",
    "ns-1846.awsdns-38.co.uk",
    "ns-467.awsdns-58.com",
    "ns-1185.awsdns-20.org",
  ]
  ttl     = 86400
  type    = "NS"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Delegate staging-a.cool.cyber.dhs.gov from the cool.cyber.dhs.gov zone.
#
# NOTE: The values below for the records attribute are the nameservers for the
# staging-a.cool.cyber.dhs.gov zone and since they are not available until that
# zone is created, these values must be updated manually after that is done.
# ------------------------------------------------------------------------------
resource "aws_route53_record" "staging-a_cool_NS" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name = "staging-a.cool.cyber.dhs.gov"
  records = [
    "ns-1328.awsdns-38.org",
    "ns-1995.awsdns-57.co.uk",
    "ns-1022.awsdns-63.net",
    "ns-198.awsdns-24.com",
  ]
  ttl     = 86400
  type    = "NS"
  zone_id = aws_route53_zone.cool_cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Delegate dev-a.cyber.dhs.gov from the cyber.dhs.gov zone.
#
# NOTE: The values below for the records attribute are the nameservers for the
# dev-a.cyber.dhs.gov zone and since they are not available until that zone
# is created, these values must be updated manually after that is done.
# ------------------------------------------------------------------------------
resource "aws_route53_record" "dev-a_NS" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name = "dev-a.cyber.dhs.gov"
  records = [
    "ns-1869.awsdns-41.co.uk",
    "ns-382.awsdns-47.com",
    "ns-886.awsdns-46.net",
    "ns-1154.awsdns-16.org",
  ]
  ttl     = 86400
  type    = "NS"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Delegate dev-a.cool.cyber.dhs.gov from the cool.cyber.dhs.gov zone.
#
# NOTE: The values below for the records attribute are the nameservers for the
# dev-a.cool.cyber.dhs.gov zone and since they are not available until that
# zone is created, these values must be updated manually after that is done.
# ------------------------------------------------------------------------------
resource "aws_route53_record" "dev-a_cool_NS" {
  # Only create this resource in the production workspace
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.route53resourcechange

  name = "dev-a.cool.cyber.dhs.gov"
  records = [
    "ns-1037.awsdns-01.org",
    "ns-477.awsdns-59.com",
    "ns-1899.awsdns-45.co.uk",
    "ns-938.awsdns-53.net",
  ]
  ttl     = 86400
  type    = "NS"
  zone_id = aws_route53_zone.cool_cyber_dhs_gov.zone_id
}
