# AWS VPC Internet Gateway Terraform Resource

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
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internet_gateway_name"></a> [internet\_gateway\_name](#input\_internet\_gateway\_name) | Internet Gateway name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internet_gateway"></a> [internet\_gateway](#output\_internet\_gateway) | n/a |

## Usage

```hcl
module "internet_gateway" {
  source                = "git::https://github.com/maishio/terraform-aws-resources.git//internet_gateway"
  internet_gateway_name = "${var.tags.service}-${var.tags.env}-igw"
  tags                  = var.tags
  vpc_id                = module.vpc.vpc.id
}
```
