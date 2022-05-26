module "cognito" {
  source = "git::https://github.com/norishio2022/terraform-aws-resources.git//cognito"

  # --------------------------------------------------------------------------------
  # Amazon Cognito User Pool 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool
  # --------------------------------------------------------------------------------

  tags           = var.tags
  user_pool_name = "${var.tags.service}-${var.tags.env}-user-pool"

  # --------------------------------------------------------------------------------
  # Amazon Cognito User Pool Client 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client
  # --------------------------------------------------------------------------------

  allowed_oauth_flows          = ["code"]
  allowed_oauth_scopes         = ["openid"]
  callback_urls                = ["https://${data.aws_route53_zone.this.name}/oauth2/idpresponse"]
  explicit_auth_flows          = ["ADMIN_NO_SRP_AUTH"]
  logout_urls                  = ["https://${data.aws_route53_zone.this.name}"]
  generate_secret              = true
  supported_identity_providers = ["COGNITO"]
  user_pool_client_name        = "${var.tags.service}-${var.tags.env}-user-pool-client"

  # --------------------------------------------------------------------------------
  # Amazon Cognito User Pool Domain 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain
  # --------------------------------------------------------------------------------

  certificate_arn = module.cognito_acm.acm_certificate.arn
  domain          = "auth.${data.aws_route53_zone.this.name}"

  # --------------------------------------------------------------------------------
  # Amazon Route53 Record 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
  # --------------------------------------------------------------------------------

  record_name = "auth.${data.aws_route53_zone.this.name}"
  type        = "A"
  zone_id     = data.aws_route53_zone.this.zone_id
}
