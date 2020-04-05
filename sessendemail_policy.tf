# ------------------------------------------------------------------------------
# Create the IAM policy that allows the sending of email via AWS SES.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "sessendemail_doc" {
  statement {
    actions = [
      "ses:Send*",
    ]

    resources = [
      aws_ses_domain_identity.cyhy_dhs_gov_identity.arn
    ]
  }
}

resource "aws_iam_policy" "sessendemail_policy" {
  provider = aws.dnsprovisionaccount

  description = var.sessendemail_role_description
  name        = var.sessendemail_role_name
  policy      = data.aws_iam_policy_document.sessendemail_doc.json
}
