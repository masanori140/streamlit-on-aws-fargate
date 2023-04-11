# Amazon VPC Nat Gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "this" {
  count         = length(var.nat_gateways)
  allocation_id = aws_eip.this[count.index].id
  subnet_id     = var.nat_gateways[count.index].subnet_id
  tags          = merge(var.tags, { "Name" = var.nat_gateways[count.index].name })
}

# Amazon EC2 Elastic IP
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "this" {
  count = length(var.nat_gateways)
  tags  = merge(var.tags, { "Name" = var.nat_gateways[count.index].name })
}
