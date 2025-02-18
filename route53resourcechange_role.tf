# ------------------------------------------------------------------------------
# Create the IAM role that allows all of the route53 actions necessary to modify
# resource records in the DNS zone.
# ------------------------------------------------------------------------------

# An IAM policy document that allows the Users account and any
# additionally-specified accounts to assume the role.
data "aws_iam_policy_document" "route53resourcechange_assume_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    principals {
      # Account usage needs:
      # - Additional: The use case for each account should be documented with
      #   a comment in the Terraform variables file
      # - Users: Ongoing maintenance of the cyber.dhs.gov zone
      identifiers = concat(
        var.additional_route53_resource_change_account_ids,
        [local.users_account_id]
      )
      type = "AWS"
    }
  }
}

resource "aws_iam_role" "route53resourcechange_role" {
  provider = aws.dnsprovisionaccount

  assume_role_policy = data.aws_iam_policy_document.route53resourcechange_assume_role_doc.json
  description        = var.route53resourcechange_role_description
  name               = var.route53resourcechange_role_name
}

resource "aws_iam_role_policy_attachment" "route53resourcechange_policy_attachment" {
  provider = aws.dnsprovisionaccount

  policy_arn = aws_iam_policy.route53resourcechange_policy.arn
  role       = aws_iam_role.route53resourcechange_role.name
}
