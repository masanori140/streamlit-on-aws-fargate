# Amazon VPC Route Table Terraform Resource

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
| [aws_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_route"></a> [route](#input\_route) | A list of route objects | `any` | `[]` | no |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | Route table name | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to associate with the route table | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route_table"></a> [route\_table](#output\_route\_table) | n/a |

## Usage

```hcl

# Current Availability Zone

data "aws_availability_zones" "this" {
  state = "available"
}

# Public route table

module "public_route_table" {
  source = "git::https://github.com/maishio/terraform-aws-resources.git//route_table"
  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway.id
    }
  ]
  route_table_name = "${var.tags.service}-${var.tags.env}-public"
  subnet_ids       = module.public_subnet.subnet.*.id
  tags             = var.tags
  vpc_id           = module.vpc.vpc.id
}

# Private route table

module "private_route_table_1a" {
  source = "git::https://github.com/maishio/terraform-aws-resources.git//route_table"
  route = [
    {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = module.nat_gateway.nat_gateway.0.id
    }
  ]
  route_table_name = "${var.tags.service}-${var.tags.env}-pri-${data.aws_availability_zones.this.names[0]}"
  subnet_ids       = [module.private_subnet.subnet.0.id]
  tags             = var.tags
  vpc_id           = module.vpc.vpc.id
}
```
