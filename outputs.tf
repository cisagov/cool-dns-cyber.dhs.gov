output "cyber_dhs_gov_zone" {
  value       = aws_route53_zone.cyber_dhs_gov
  description = "The cyber.dhs.gov public hosted zone."
}

output "route53resourcechange_role" {
  value       = aws_iam_role.route53resourcechange_role
  description = "IAM role that allows sufficient permissions to modify resource records in the DNS zone."
}
