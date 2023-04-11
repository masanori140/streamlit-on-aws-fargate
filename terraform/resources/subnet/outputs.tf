# Amazon VPC Subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

output "subnet" {
  value = aws_subnet.this
}
