output "cognito_user_pool_arn" {
  description = "ARN of the Cognito User Pool"
  value       = module.cognito.cognito_user_pool.arn
}

output "cognito_user_pool_client_id" {
  description = "ID of the Cognito User Pool Client"
  value       = module.cognito.cognito_user_pool_client.id
}

output "cognito_user_pool_domain_domain" {
  description = "Domain of the Cognito User Pool Domain"
  value       = module.cognito.cognito_user_pool_domain.domain
}
