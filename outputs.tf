output "cyber_dhs_gov_zone" {
  value       = aws_route53_zone.cyber_dhs_gov
  description = "The cyber.dhs.gov public hosted zone."
}

output "route53resourcechange_role" {
  value       = aws_iam_role.route53resourcechange_role
  description = "IAM role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone."
}

output "sesmanagesuppressionlist_role" {
  value       = aws_iam_role.sesmanagesuppressionlist_role
  description = "IAM role that allows sufficient permissions to manage the AWS SES suppression list."
}

output "sessendemail_role" {
  value       = aws_iam_role.sessendemail_role
  description = "IAM role that allows sufficient permissions to send email via AWS SES."
}
