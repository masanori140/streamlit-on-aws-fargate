# Amazon Cognito User Pool Domain
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain

resource "aws_cognito_user_pool_domain" "this" {
  certificate_arn = var.certificate_arn
  domain          = var.domain
  user_pool_id    = var.user_pool_id
}
