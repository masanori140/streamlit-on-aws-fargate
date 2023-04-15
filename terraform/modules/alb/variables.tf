variable "account" {
  description = "AWS Account ID."
  type        = map(string)
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate to use for the ALB."
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

variable "user_pool_arn" {
  description = "ARN of the Cognito User Pool to use for authentication."
  type        = string
}

variable "user_pool_client_id" {
  description = "Client ID of the Cognito User Pool to use for authentication."
  type        = string
}

variable "user_pool_domain" {
  description = "Domain of the Cognito User Pool to use for authentication."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to create the ALB in."
  type        = string
}
