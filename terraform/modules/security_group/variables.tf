variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
