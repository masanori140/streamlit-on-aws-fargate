module "user_pool" {
  source = "../../resources/cognito/user_pool"
  name   = "${var.tags.service}-${var.tags.env}-user-pool"
  tags   = var.tags
}

module "user_pool_client" {
  source                       = "../../resources/cognito/user_pool_client"
  allowed_oauth_flows          = ["code"]
  allowed_oauth_scopes         = ["openid"]
  callback_urls                = ["https://${data.aws_route53_zone.this.name}/oauth2/idpresponse"]
  explicit_auth_flows          = ["ADMIN_NO_SRP_AUTH"]
  generate_secret              = true
  logout_urls                  = ["https://${data.aws_route53_zone.this.name}"]
  name                         = "${var.tags.service}-${var.tags.env}-user-pool-client"
  supported_identity_providers = ["COGNITO"]
  user_pool_id                 = module.user_pool.cognito_user_pool.id
}

module "user_pool_domain" {
  source          = "../../resources/cognito/user_pool_domain"
  certificate_arn = var.cognito_acm_certificate_arn
  domain          = "auth.${data.aws_route53_zone.this.name}"
  user_pool_id    = module.user_pool.cognito_user_pool.id
  depends_on      = [module.alb_record]
}
