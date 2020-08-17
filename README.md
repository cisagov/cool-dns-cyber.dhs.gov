# cool-dns-cyber.dhs.gov #

[![GitHub Build Status](https://github.com/cisagov/cool-dns-cyber.dhs.gov/workflows/build/badge.svg)](https://github.com/cisagov/cool-dns-cyber.dhs.gov/actions)

This repository contains a Terraform configuration that will provision the DNS zone
`cyber.dhs.gov` within the COOL.  It creates an IAM role that allows sufficient
permissions to modify resources records in this zone.  This role has a trust
relationship with the users account.

## Usage ##

1. Run the command `terraform init`.
1. Run the command `terraform apply`.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.0 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| aws.dnsprovisionaccount | ~> 2.0 |
| aws.organizationsreadonly | ~> 2.0 |
| aws.route53resourcechange | ~> 2.0 |
| terraform | n/a |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | The AWS region to communicate with. | `string` | `us-east-1` | no |
| cyhy_account_id | The ID of the CyHy account. | `string` | n/a | yes |
| route53resourcechange_role_description | The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone. | `string` | `Allows sufficient permissions to modify resource records in the DNS zone.` | no |
| route53resourcechange_role_name | The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone. | `string` | `Route53ResourceChange-cyber.dhs.gov` | no |
| sessendemail_role_description | The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to send email via AWS SES. | `string` | `Allows sufficient permissions to send email via AWS SES.` | no |
| sessendemail_role_name | The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to send email via AWS SES. | `string` | `SesSendEmail-cyber.dhs.gov` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{"Application": "COOL - DNS - cyber.dhs.gov", "Team": "VM Fusion - Development", "Workspace": "production"}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| cyber_dhs_gov_zone | The cyber.dhs.gov public hosted zone. |
| route53resourcechange_role | IAM role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone. |
| sessendemail_role | IAM role that allows sufficient permissions to send email via AWS SES. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every
directory that contains Terraform code. In this repository, this is
just the main directory.

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
