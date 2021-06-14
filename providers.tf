# This is the "default" provider that is used assume the roles in the
# other providers.  It uses the credentials of the caller.  It is also
# used to assume the roles required to access remote state in the
# Terraform backend.
provider "aws" {
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create new public hosted zones.
provider "aws" {
  alias = "dnsprovisionaccount"
  assume_role {
    role_arn     = data.terraform_remote_state.dns.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to lookup account IDs.  See locals.
provider "aws" {
  alias = "organizationsreadonly"
  assume_role {
    role_arn     = data.terraform_remote_state.master.outputs.organizationsreadonly_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider that uses the newly-created role to modify zone resources.
provider "aws" {
  alias = "route53resourcechange"
  assume_role {
    role_arn     = aws_iam_role.route53resourcechange_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}
