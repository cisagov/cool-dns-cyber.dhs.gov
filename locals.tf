data "aws_caller_identity" "current" {}

data "aws_organizations_organization" "cool" {
  provider = aws.organizationsreadonly
}

locals {
  # Extract the user name of the current caller for use as assume role session names.
  caller_user_name = split("/", data.aws_caller_identity.current.arn)[1]

  # Find the Users account by name and email.
  users_account_id = [
    for x in data.aws_organizations_organization.cool.accounts :
    x.id if x.name == "Users" && length(regexall("2020", x.email)) > 0
  ][0]
}
