# Amazon VPC Subnet Terraform Resource

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
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Whether to assign a public IP to instances in the subnet | `string` | `false` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Array of maps with subnet attributes | `list(map(string))` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |

## Usage

```hcl

# Current Availability Zones

data "aws_availability_zones" "this" {
  state = "available"
}

# Create Subnets

module "public_subnet" {
  source = "git::https://github.com/maishio/terraform-aws-resources.git//subnet"
  vpc_id = module.vpc.vpc.id
  subnets = [
    {
      availability_zone = data.aws_availability_zones.this.names[0]
      cidr_block        = "10.0.0.0/24"
      name              = "${var.tags.service}-${var.tags.env}-pub-${data.aws_availability_zones.this.names[0]}",
    },
    {
      availability_zone = data.aws_availability_zones.this.names[1]
      cidr_block        = "10.0.1.0/24"
      name              = "${var.tags.service}-${var.tags.env}-pub-${data.aws_availability_zones.this.names[1]}",
    },
  ]
  tags = var.tags
}
```
