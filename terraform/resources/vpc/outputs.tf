# Amazon VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

output "vpc" {
  value = aws_vpc.this
}
