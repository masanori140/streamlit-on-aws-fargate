variable "region" {
  description = "AWS Region ID."
  type        = map(string)
}

variable "security_groups" {
  description = "Security groups to attach to the ECS service."
  type        = list(string)
}

variable "subnets" {
  description = "Subnets to attach to the ECS service."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "target_group_arn" {
  description = "Target group ARN to attach to the ECS service."
  type        = string
}
