# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "cyhy_account_id" {
  description = "The ID of the CyHy account."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "acmresourcechange_role_description" {
  default     = "Allows sufficient permissions to modify ACM resources in the DNS account."
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify ACM (AWS Certificate Manager) resources in the DNS account."
  nullable    = false
  type        = string
}

variable "acmresourcechange_role_name" {
  default     = "ACMResourceChange"
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify ACM (AWS Certificate Manager) resources in the DNS account."
  nullable    = false
  type        = string
}

variable "additional_remote_state_account_ids" {
  default     = []
  description = "A list of account IDs corresponding to additional accounts that should have permission to assume the role to read this root module's remote state (e.g. [\"123456789012\"])."
  nullable    = false
  type        = list(string)
}

variable "additional_ses_sendemail_account_ids" {
  default     = []
  description = "A list of account IDs corresponding to additional accounts that should have permission to assume the role to send email via AWS SES (e.g. [\"123456789012\"])."
  nullable    = false
  type        = list(string)
}

variable "api_gateway_zone_id" {
  default     = "Z1UJRXOUMOOFQ8"
  description = "The Route 53 hosted zone ID for API gateways."
  nullable    = false
  type        = string
}

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to communicate with."
  nullable    = false
  type        = string
}

variable "read_terraform_state_role_name" {
  default     = "ReadCyberDhsGovTerraformState"
  description = "The name to assign the IAM role and policy that allows read-only access to the cool-dns-cyber.dhs.gov state in the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

variable "route53resourcechange_role_description" {
  default     = "Allows sufficient permissions to modify resource records in the DNS zone."
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone."
  nullable    = false
  type        = string
}

variable "route53resourcechange_role_name" {
  default     = "Route53ResourceChange-cyber.dhs.gov"
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone."
  nullable    = false
  type        = string
}

variable "sesmanagesuppressionlist_role_description" {
  default     = "Allows sufficient permissions to manage the suppression list."
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to manage the suppression list."
  nullable    = false
  type        = string
}

variable "sesmanagesuppressionlist_role_name" {
  default     = "SesManageSuppressionList-cyber.dhs.gov"
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to manage the suppression list."
  nullable    = false
  type        = string
}

variable "sessendemail_role_description" {
  default     = "Allows sufficient permissions to send email via AWS SES."
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to send email via AWS SES."
  nullable    = false
  type        = string
}

variable "sessendemail_role_name" {
  default     = "SesSendEmail-cyber.dhs.gov"
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to send email via AWS SES."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
