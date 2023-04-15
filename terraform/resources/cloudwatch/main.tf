# Amazon CloudWatch Logs Log Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group

resource "aws_cloudwatch_log_group" "this" {
  kms_key_id        = var.kms_key_id
  name              = var.name
  retention_in_days = var.retention_in_days
  tags              = merge(var.tags, { "Name" = var.name })
}
