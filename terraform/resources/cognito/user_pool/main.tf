# Amazon Cognito User Pool
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool

resource "aws_cognito_user_pool" "this" {
  auto_verified_attributes = var.auto_verified_attributes
  mfa_configuration        = var.mfa_configuration
  name                     = var.name
  tags                     = merge(var.tags, { "Name" = var.name })

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
