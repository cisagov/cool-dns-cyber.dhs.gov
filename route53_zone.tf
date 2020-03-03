resource "aws_route53_zone" "cyber_dhs_gov" {
  provider = aws.dns_provision_role

  delegation_set_id = data.terraform_remote_state.dns.outputs.primary_delegation_set.id
  name              = "cyber.dhs.gov"
}
