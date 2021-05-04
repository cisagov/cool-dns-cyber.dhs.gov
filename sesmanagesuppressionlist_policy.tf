# ------------------------------------------------------------------------------
# Create the IAM policy that allows management of the AWS SES
# suppression list.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "sesmanagesuppressionlist_doc" {
  # Allow all suppression list manipulations
  statement {
    actions = [
      "ses:DeleteSuppressedDestination",
      "ses:GetSuppressedDestination",
      "ses:ListSuppressedDestinations",
      "ses:PutAccountSuppressionAttributes",
      "ses:PutConfigurationSetSuppressionOptions",
      "ses:PutSuppressedDestination",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "sesmanagesuppressionlist_policy" {
  provider = aws.dnsprovisionaccount

  description = var.sesmanagesuppressionlist_role_description
  name        = var.sesmanagesuppressionlist_role_name
  policy      = data.aws_iam_policy_document.sesmanagesuppressionlist_doc.json
}
