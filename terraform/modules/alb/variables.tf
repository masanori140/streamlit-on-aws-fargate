variable "account" {
  description = "AWS Account ID."
  type        = map(string)
}

variable "alb_acm_certificate_arn" {
  description = "ARN of the ACM certificate to use for the ALB."
  type        = string
}

variable "cognito_acm_certificate_arn" {
  description = "ARN of the ACM certificate to use for the Cognito User Pool Domain."
  type        = string
}

variable "hostzone" {
  description = "A map of Route53 Hosted Zone to create the DNS record in."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the ALB."
  type        = list(string)
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the ALB."
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC to create the ALB in."
  type        = string
}
