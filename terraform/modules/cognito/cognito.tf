module "cognito" {
  source = "../../resources/cognito"

  # Amazon Cognito User Pool
  tags           = var.tags
  user_pool_name = "${var.tags.service}-${var.tags.env}-user-pool"

  # Amazon Cognito User Pool Client
  allowed_oauth_flows          = ["code"]
  allowed_oauth_scopes         = ["openid"]
  callback_urls                = ["https://${data.aws_route53_zone.this.name}/oauth2/idpresponse"]
  explicit_auth_flows          = ["ADMIN_NO_SRP_AUTH"]
  logout_urls                  = ["https://${data.aws_route53_zone.this.name}"]
  generate_secret              = true
  supported_identity_providers = ["COGNITO"]
  user_pool_client_name        = "${var.tags.service}-${var.tags.env}-user-pool-client"

  # Amazon Cognito User Pool Domain
  certificate_arn = var.certificate_arn
  domain          = "auth.${data.aws_route53_zone.this.name}"
}
