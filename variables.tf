# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)"
  default     = "us-east-1"
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}

variable "route53resourcechange_role_description" {
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone."
  default     = "Allows sufficient permissions to modify resource records in the DNS zone."
}

variable "route53resourcechange_role_name" {
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone."
  default     = "Route53ResourceChange-cyber.dhs.gov"
}

variable "users_account_id" {
  description = "The ID of the users account.  This account will be allowed to assume the role that allows sufficient permissions to provision all AWS resources in the Images account."
}
