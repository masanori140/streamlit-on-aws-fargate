# Amazon VPC Route Table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

output "route_table" {
  value = aws_route_table.this
}
