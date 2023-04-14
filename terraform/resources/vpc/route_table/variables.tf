# Amazon VPC Route Table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

variable "route" {
  description = "A list of route objects for the dynamic block."
  type        = any
  default     = []
}

variable "route_table_name" {
  description = "Route table name"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

# Amazon VPC Route Table Association
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

variable "subnet_ids" {
  description = "A list of subnet IDs to associate with the route table"
  type        = list(string)
  default     = []
}
