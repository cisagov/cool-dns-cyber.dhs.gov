# ------------------------------------------------------------------------------
# Create the IAM role that allows the sending of email via AWS SES
# ------------------------------------------------------------------------------

# An IAM policy document that allows the users account and the CyHy
# account to assume the role.
data "aws_iam_policy_document" "sessendemail_assume_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    principals {
      type = "AWS"
      # Account usage needs:
      # - CyHy: Email the CyHy and BOD 18-01 reports and the CybEx scorecard
      # - Domain Manager: Send various notification emails to internal users
      # - INL: Test sending phishing emails for Phishing Campaign Assessments
      # - PCA: Send phishing emails for Phishing Campaign Assessments
      # - Users: Send an alert email when a new user account is created
      identifiers = concat(
        [var.cyhy_account_id],
        local.domainmanager_account_ids,
        local.inl_account_ids,
        local.pca_account_ids,
        [local.users_account_id]
      )
    }
  }
}

resource "aws_iam_role" "sessendemail_role" {
  provider = aws.dnsprovisionaccount

  assume_role_policy = data.aws_iam_policy_document.sessendemail_assume_role_doc.json
  description        = var.sessendemail_role_description
  name               = var.sessendemail_role_name
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "sessendemail_policy_attachment" {
  provider = aws.dnsprovisionaccount

  policy_arn = aws_iam_policy.sessendemail_policy.arn
  role       = aws_iam_role.sessendemail_role.name
}
