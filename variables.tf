# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to communicate with."
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default = {
    Team        = "VM Fusion - Development"
    Application = "COOL - DNS - cyber.dhs.gov"
    Workspace   = "production"
  }
}

variable "route53resourcechange_role_description" {
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone."
  default     = "Allows sufficient permissions to modify resource records in the DNS zone."
}

variable "route53resourcechange_role_name" {
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone."
  default     = "Route53ResourceChange-cyber.dhs.gov"
}
