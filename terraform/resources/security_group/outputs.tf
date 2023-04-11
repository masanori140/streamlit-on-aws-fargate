# Amazon VPC Security Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

output "security_group" {
  value = aws_security_group.this
}
