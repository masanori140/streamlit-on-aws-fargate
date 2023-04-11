# Amazon VPC Internet Gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

variable "internet_gateway_name" {
  description = "Internet Gateway name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
