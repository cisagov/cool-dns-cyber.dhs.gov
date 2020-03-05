# cool-dns.cyber.dhs.gov #

[![GitHub Build Status](https://github.com/cisagov/cool-dns.cyber.dhs.gov/workflows/build/badge.svg)](https://github.com/cisagov/cool-dns.cyber.dhs.gov/actions)

This is a generic skeleton project that can be used to quickly get a
new [cisagov](https://github.com/cisagov) [Terraform
module](https://www.terraform.io/docs/modules/index.html) GitHub
repository started.  This skeleton project contains [licensing
information](LICENSE), as well as [pre-commit
hooks](https://pre-commit.com) and
[GitHub Actions](https://github.com/features/actions) configurations
appropriate for the major languages that we use.

See [here](https://www.terraform.io/docs/modules/index.html) for more
details on Terraform modules and the standard module structure.

## Usage ##

```hcl
module "example" {
  source = "github.com/cisagov/cool-dns.cyber.dhs.gov"

  aws_region            = "us-west-1"
  aws_availability_zone = "b"
  subnet_id             = "subnet-0123456789abcdef0"

  tags = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}
```

## Examples ##

* [Deploying into the default VPC](https://github.com/cisagov/cool-dns.cyber.dhs.gov/tree/develop/examples/default_vpc)

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| aws_region | The AWS region to communicate with. | `string` | `us-east-1` | no |
| route53resourcechange_role_description | The description to associate with the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone. | `string` | `Allows sufficient permissions to modify resource records in the DNS zone.` | no |
| route53resourcechange_role_name | The name to assign the IAM role (as well as the corresponding policy) that allows sufficient permissions to modify resource records in the DNS zone. | `string` | `Route53ResourceChange-cyber.dhs.gov` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{"Application": "COOL - DNS cyber.dhs.gov", "Team": "VM Fusion - Development", "Workspace": "production"}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| cyber_dhs_gov_zone | The cyber.dhs.gov public hosted zone. |
| route53resourcechange_role | IAM role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone. |

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
