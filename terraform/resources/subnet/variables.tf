# Amazon VPC Subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

variable "map_public_ip_on_launch" {
  description = "Whether to assign a public IP to instances in the subnet"
  type        = string
  default     = false
}

variable "subnets" {
  description = "Array of maps with subnet attributes"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
