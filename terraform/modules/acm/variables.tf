variable "hostzone" {
  description = "A map of Route53 Hosted Zone to create the DNS record in."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
