# ------------------------------------------------------------------------------
# Create the IAM role that allows all of the ACM actions necessary to manage
# certificates in the DNS account.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "acmresourcechange_role" {
  provider = aws.dnsprovisionaccount

  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
  description        = var.acmresourcechange_role_description
  name               = var.acmresourcechange_role_name
}

resource "aws_iam_role_policy_attachment" "acmresourcechange_policy_attachment" {
  provider = aws.dnsprovisionaccount

  policy_arn = aws_iam_policy.acmresourcechange_policy.arn
  role       = aws_iam_role.acmresourcechange_role.name
}
