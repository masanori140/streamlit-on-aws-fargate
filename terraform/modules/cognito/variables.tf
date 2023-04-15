variable "certificate_arn" {
  description = "ARN of ACM Certificate to use for the Cognito User Pool Domain."
  type        = string
}

variable "hostzone" {
  description = "A map of public hosted zone."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
