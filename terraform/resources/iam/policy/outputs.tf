# AWS IAM Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy

output "iam_policy" {
  value = aws_iam_policy.this
}
