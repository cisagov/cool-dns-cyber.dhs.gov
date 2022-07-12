# ------------------------------------------------------------------------------
# Create the IAM policy that allows all of the ACM actions necessary to manage
# certificates in the DNS account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "acmresourcechange_doc" {

  statement {
    actions = [
      "acm:AddTagsToCertificate",
      "acm:DeleteCertificate",
      "acm:DescribeCertificate",
      "acm:GetCertificate",
      "acm:ListCertificates",
      "acm:ListTagsForCertificate",
      "acm:RemoveTagsFromCertificate",
      "acm:RequestCertificate",
      "acm:UpdateCertificateOptions",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "acmresourcechange_policy" {
  provider = aws.dnsprovisionaccount

  description = var.acmresourcechange_role_description
  name        = var.acmresourcechange_role_name
  policy      = data.aws_iam_policy_document.acmresourcechange_doc.json
}
