# Amazon VPC Nat Gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

variable "nat_gateways" {
  description = "A list containing attributes of NAT Gateways"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

# Amazon EC2 Elastic IP
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

variable "vpc" {
  description = "Boolean if the EIP is in a VPC or not"
  type        = bool
  default     = true
}
