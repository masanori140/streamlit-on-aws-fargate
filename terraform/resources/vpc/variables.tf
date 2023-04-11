# Amazon VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "cidr_block" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
