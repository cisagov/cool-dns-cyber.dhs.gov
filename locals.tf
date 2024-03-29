# ------------------------------------------------------------------------------
# Retrieve the effective Account ID, User ID, and ARN in which Terraform is authorized.
# This is used to calculate the session names for assumed roles.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

# ------------------------------------------------------------------------------
# Retrieve the information for all accouts in the organization.  This is used to lookup
# the Users account ID for use in the assume role policy.
# ------------------------------------------------------------------------------
data "aws_organizations_organization" "cool" {
  provider = aws.organizationsreadonly
}

# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this configuration.
# ------------------------------------------------------------------------------
locals {
  # Extract the user name of the current caller for use as assume role session names.
  caller_user_name = split("/", data.aws_caller_identity.current.arn)[1]

  # Find the DNS account by name
  dns_account_id = [
    for x in data.aws_organizations_organization.cool.accounts :
    x.id if x.name == "DNS"
  ][0]

  # Find the Domain Manager accounts by name
  domainmanager_account_ids = [
    for x in data.aws_organizations_organization.cool.accounts :
    x.id if length(regexall("^Domain Manager \\((?:Staging|Production)\\)$", x.name)) > 0
  ]

  # Find the INL accounts by name
  inl_account_ids = [
    for x in data.aws_organizations_organization.cool.accounts :
    x.id if length(regexall("^inl\\d+ \\((?:Staging|Production)\\)$", x.name)) > 0
  ]

  # Find the PCA accounts by name
  pca_account_ids = [
    for x in data.aws_organizations_organization.cool.accounts :
    x.id if length(regexall("^PCA \\((?:Staging|Production)\\)$", x.name)) > 0
  ]

  # Find the Users account by name.
  users_account_id = [
    for x in data.aws_organizations_organization.cool.accounts :
    x.id if x.name == "Users"
  ][0]
}
