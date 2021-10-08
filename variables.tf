# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "cyhy_account_id" {
  type        = string
  description = "The ID of the CyHy account."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "additional_remote_state_account_ids" {
  type        = list(string)
  description = "A list of account IDs corresponding to additional accounts that should have permission to assume the role to read this root module's remote state (e.g. [\"123456789012\"])."
  default     = []
}

variable "aws_region" {
  type        = string
  description = "The AWS region to communicate with."
  default     = "us-east-1"
}

variable "cloudfront_zone_id" {
  type        = string
  description = "The ID of the Cloudfront hosted zone. This is set by AWS and is a constant across all Cloudfront distributions."
  default     = "Z2FDTNDATAQYW2"
}

variable "read_terraform_state_role_name" {
  type        = string
  description = "The name to assign the IAM role and policy that allows read-only access to the cool-dns-cyber.dhs.gov state in the S3 bucket where Terraform state is stored."
  default     = "ReadCyberDhsGovTerraformState"
}

variable "route53resourcechange_role_description" {
  type        = string
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone."
  default     = "Allows sufficient permissions to modify resource records in the DNS zone."
}

variable "route53resourcechange_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone."
  default     = "Route53ResourceChange-cyber.dhs.gov"
}

variable "sesmanagesuppressionlist_role_description" {
  type        = string
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to manage the suppression list."
  default     = "Allows sufficient permissions to manage the suppression list."
}

variable "sesmanagesuppressionlist_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to manage the suppression list."
  default     = "SesManageSuppressionList-cyber.dhs.gov"
}

variable "sessendemail_role_description" {
  type        = string
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to send email via AWS SES."
  default     = "Allows sufficient permissions to send email via AWS SES."
}

variable "sessendemail_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to send email via AWS SES."
  default     = "SesSendEmail-cyber.dhs.gov"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
