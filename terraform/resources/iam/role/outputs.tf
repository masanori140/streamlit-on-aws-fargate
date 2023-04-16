# AWS IAM Role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

output "iam_role" {
  value = aws_iam_role.this
}
