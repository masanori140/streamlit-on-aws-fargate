# Amazon VPC Subnet
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "this" {
  count                   = length(var.subnets)
  availability_zone       = var.subnets[count.index].availability_zone
  cidr_block              = var.subnets[count.index].cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = merge(var.tags, { Name = var.subnets[count.index].name })
  vpc_id                  = var.vpc_id
}
