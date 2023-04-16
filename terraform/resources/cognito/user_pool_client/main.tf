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
  name                                 = var.name
  read_attributes                      = var.read_attributes
  refresh_token_validity               = var.refresh_token_validity
  supported_identity_providers         = var.supported_identity_providers
  user_pool_id                         = var.user_pool_id
  write_attributes                     = var.write_attributes
}
