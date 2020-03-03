
provider "aws" {
  region = var.aws_region
}

# This is the "default" provider that is used to create resources
# inside the DNS account
provider "aws" {
  alias  = "dns_provision_role"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.dns.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

provider "aws" {
  alias  = "resource_change_role"
  region = var.aws_region
  assume_role {
    role_arn     = aws_iam_role.route53resourcechange_role.arn
    session_name = local.caller_user_name
  }
}

provider "aws" {
  alias  = "organizationsreadonly"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.master.outputs.organizationsreadonly_role.arn
    session_name = local.caller_user_name
  }
}
