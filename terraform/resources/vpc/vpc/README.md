# Amazon VPC Terraform Resource

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.4.0 |

## Providers

| Name | Version   |
|------|-----------|
| aws  | ~> 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The IPv4 CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | A boolean flag to enable/disable DNS support in the VPC | `bool` | `true` | no |
| <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy) | A tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |

## Usage

```hcl
module "vpc" {
  source     = "git::https://github.com/maishio/terraform-aws-resources.git//vpc"
  cidr_block = "10.0.0.0/16"
  tags       = var.tags
  vpc_name   = "${var.tags.service}-${var.tags.env}-vpc"
}
```
