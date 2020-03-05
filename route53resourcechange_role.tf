# ------------------------------------------------------------------------------
# Create the IAM role that allows all of the route53 actions necessary to
# modify resource records in the DNS zone.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "route53resourcechange_role" {
  provider = aws.dnsprovisionaccount

  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
  description        = var.route53resourcechange_role_description
  name               = var.route53resourcechange_role_name
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "route53resourcechange_policy_attachment" {
  provider = aws.dnsprovisionaccount

  policy_arn = aws_iam_policy.route53resourcechange_policy.arn
  role       = aws_iam_role.route53resourcechange_role.name
}
