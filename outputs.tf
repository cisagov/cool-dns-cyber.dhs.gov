output "route53resourcechange_role" {
  value       = aws_iam_role.route53resourcechange_role
  description = "IAM role that allows sufficient permissions to modify resource records in the DNS zone."
}
