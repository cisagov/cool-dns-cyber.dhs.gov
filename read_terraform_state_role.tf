# ------------------------------------------------------------------------------
# Create the IAM policy and role that allows read-only access to the Terraform
# state for this project in the S3 bucket where Terraform remote state is
# stored.
# ------------------------------------------------------------------------------

module "read_terraform_state" {
  source = "github.com/cisagov/terraform-state-read-role-tf-module"

  providers = {
    aws = aws.terraformprovisionaccount
    # This provider isn't used because of the create_assume_role =
    # false below.
    aws.users = aws
  }

  account_ids = distinct(concat([
    local.users_account_id
  ], var.additional_remote_state_account_ids))
  # Don't create the assume role policy
  create_assume_role          = false
  role_name                   = var.read_terraform_state_role_name
  terraform_state_bucket_name = "cisa-cool-terraform-state"
  terraform_state_path        = "cool-dns-cyber.dhs.gov/*.tfstate"
}
