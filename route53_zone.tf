# ------------------------------------------------------------------------------
# Create the cyber.dhs.gov zone and configure it with our primary reusable delegation
# set.
# ------------------------------------------------------------------------------
resource "aws_route53_zone" "cyber_dhs_gov" {
  provider = aws.dnsprovisionaccount

  delegation_set_id = data.terraform_remote_state.dns.outputs.primary_delegation_set.id
  name              = "cyber.dhs.gov"
}

# Lookup the *existing* cisa.dhs.gov zone so we can reference its ID in our records
data "aws_route53_zone" "cisa_dhs_gov" {
  provider     = aws.dnsprovisionaccount
  name         = "cisa.dhs.gov"
  private_zone = false
}