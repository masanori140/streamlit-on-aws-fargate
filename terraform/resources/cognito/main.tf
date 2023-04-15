# Amazon Cognito User Pool
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool

resource "aws_cognito_user_pool" "this" {
  auto_verified_attributes = var.auto_verified_attributes
  mfa_configuration        = var.mfa_configuration
  name                     = var.user_pool_name
  tags                     = merge(var.tags, { "Name" = var.user_pool_name })

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only
  }

  email_configuration {
    email_sending_account = var.email_sending_account
  }

  password_policy {
    minimum_length                   = var.minimum_length
    require_lowercase                = var.require_lowercase
    require_numbers                  = var.require_numbers
    require_symbols                  = var.require_symbols
    require_uppercase                = var.require_uppercase
    temporary_password_validity_days = var.temporary_password_validity_days
  }

  verification_message_template {
    default_email_option = var.default_email_option
  }
}

# Amazon Cognito User Pool Client
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client

resource "aws_cognito_user_pool_client" "this" {
  access_token_validity                = var.access_token_validity
  allowed_oauth_flows                  = var.allowed_oauth_flows
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  callback_urls                        = var.callback_urls
  enable_token_revocation              = var.enable_token_revocation
  explicit_auth_flows                  = var.explicit_auth_flows
  generate_secret                      = var.generate_secret
  id_token_validity                    = var.id_token_validity
  logout_urls                          = var.logout_urls
  name                                 = var.user_pool_client_name
  read_attributes                      = var.read_attributes
  refresh_token_validity               = var.refresh_token_validity
  supported_identity_providers         = var.supported_identity_providers
  user_pool_id                         = aws_cognito_user_pool.this.id
  write_attributes                     = var.write_attributes
}

# Amazon Cognito User Pool Domain
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain

resource "aws_cognito_user_pool_domain" "this" {
  certificate_arn = var.certificate_arn
  domain          = var.domain
  user_pool_id    = aws_cognito_user_pool.this.id
}
