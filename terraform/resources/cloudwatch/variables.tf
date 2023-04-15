# Amazon CloudWatch Logs Log Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group

variable "kms_key_id" {
  description = "ARN of the KMS Key to use when encrypting log data."
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the log group."
  type        = string
}

variable "retention_in_days" {
  description = "Number of days you want to retain log events in the specified log group."
  type        = number
  default     = 0
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
