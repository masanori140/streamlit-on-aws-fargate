# Amazon CloudWatch Logs Log Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.this
}
