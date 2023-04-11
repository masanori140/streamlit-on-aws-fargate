# Amazon VPC Internet Gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id
  tags   = merge(var.tags, { "Name" = var.internet_gateway_name })
}
