# Amazon Cognito User Pool Domain
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain

variable "certificate_arn" {
  description = "ARN of an ACM certificate in us-east-1 to be used for the custom domain."
  type        = string
  default     = null
}

variable "domain" {
  description = "Domain string."
  type        = string
}

variable "user_pool_id" {
  description = "The user pool ID."
  type        = string
}
