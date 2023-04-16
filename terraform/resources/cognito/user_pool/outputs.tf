# Amazon Cognito User Pool
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool

output "cognito_user_pool" {
  description = "Amazon Cognito User Pool resource."
  value       = aws_cognito_user_pool.this
}
