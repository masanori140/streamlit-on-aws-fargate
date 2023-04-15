# Amazon Cognito User Pool
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool

output "cognito_user_pool" {
  description = "Amazon Cognito User Pool resource."
  value       = aws_cognito_user_pool.this
}

# Amazon Cognito User Pool Client
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client

output "cognito_user_pool_client" {
  description = "Amazon Cognito User Pool Client resource."
  value       = aws_cognito_user_pool_client.this
}

# Amazon Cognito User Pool Domain
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain

output "cognito_user_pool_domain" {
  description = "Amazon Cognito User Pool Domain resource."
  value       = aws_cognito_user_pool_domain.this
}
