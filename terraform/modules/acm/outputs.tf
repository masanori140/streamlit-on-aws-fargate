output "alb_acm_certificate_arn" {
  description = "ARN of the ACM certificate for ALB"
  value       = module.alb_acm.acm_certificate.arn
}

output "cognito_acm_certificate_arn" {
  description = "ARN of the ACM certificate for Cognito"
  value       = module.cognito_acm.acm_certificate.arn
}
