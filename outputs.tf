output "acmresourcechange_role" {
  description = "IAM role that allows sufficient permissions to modify ACM resources in the DNS account."
  value       = aws_iam_role.acmresourcechange_role
}

output "cyber_dhs_gov_zone" {
  description = "The cyber.dhs.gov public hosted zone."
  value       = aws_route53_zone.cyber_dhs_gov
}

output "route53resourcechange_role" {
  description = "IAM role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone."
  value       = aws_iam_role.route53resourcechange_role
}

output "sesmanagesuppressionlist_role" {
  description = "IAM role that allows sufficient permissions to manage the AWS SES suppression list."
  value       = aws_iam_role.sesmanagesuppressionlist_role
}

output "sessendemail_role" {
  description = "IAM role that allows sufficient permissions to send email via AWS SES."
  value       = aws_iam_role.sessendemail_role
}
