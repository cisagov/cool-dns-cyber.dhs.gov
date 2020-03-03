# ------------------------------------------------------------------------------
# Create the IAM policy that allows all of the EC2 and KMS actions necessary
# to create an AMI in the Images account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "route53resourcechange_doc" {
  statement {
    actions = [
      "route53:ChangeResourceRecordSets",
      "route53:ListResourceRecordSets",
      "route53:GetHostedZone",
    ]

    resources = ["arn:aws:route53:::hostedzone/${aws_route53_zone.cyber_dhs_gov.id}"]
  }

  statement {
    actions = [
      "route53:GetChange"
    ]

    resources = ["arn:aws:route53:::change/*"]
  }
}

resource "aws_iam_policy" "route53resourcechange_policy" {
  provider = aws.dns_provision_role

  description = var.route53resourcechange_role_description
  name        = var.route53resourcechange_role_name
  policy      = data.aws_iam_policy_document.route53resourcechange_doc.json
}
