# Amazon VPC Nat Gateway Terraform Resource

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
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nat_gateways"></a> [nat\_gateways](#input\_nat\_gateways) | A list containing attributes of NAT Gateways | `list(map(string))` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Boolean if the EIP is in a VPC or not | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_gateway"></a> [nat\_gateway](#output\_nat\_gateway) | n/a |

## Usage

```hcl

# Current Availability Zone

data "aws_availability_zones" "this" {
  state = "available"
}

# Nat Gateway

module "nat_gateway" {
  source = "git::https://github.com/maishio/terraform-aws-resources.git//nat_gateway/complete"
  nat_gateways = [
    {
      name      = "${var.tags.service}-${var.tags.env}-ngw-${data.aws_availability_zones.this.names[0]}"
      subnet_id = module.public_subnet.subnet.0.id
    },
    {
      name      = "${var.tags.service}-${var.tags.env}-ngw-${data.aws_availability_zones.this.names[1]}"
      subnet_id = module.public_subnet.subnet.1.id
    },
  ]
  tags = var.tags
}
```
