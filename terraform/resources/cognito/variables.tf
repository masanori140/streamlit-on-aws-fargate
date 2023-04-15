# Amazon Cognito User Pool
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool

variable "auto_verified_attributes" {
  description = "Attributes to be auto-verified. Valid values are `email` and `phone_number`."
  type        = list(string)
  default     = []
}

variable "mfa_configuration" {
  description = "MFA configuration for the User Pool."
  type        = string
  default     = "OFF"
}

variable "user_pool_name" {
  description = "Name of the User Pool."
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

### admin_create_user_config block ###

variable "allow_admin_create_user_only" {
  description = "Set to `true` to allow only administrators to create user profiles. Set to `false` to allow non-administrators to create user profiles."
  type        = bool
  default     = true
}

### email_configuration block ###

variable "email_sending_account" {
  description = "Email delivery method to use. Valid values are `COGNITO_DEFAULT` and `DEVELOPER`."
  type        = string
  default     = "COGNITO_DEFAULT"
}

### password_policy block ###

variable "minimum_length" {
  description = "Minimum length to require for user passwords."
  type        = number
  default     = 16
}

variable "require_lowercase" {
  description = "Whether to require lowercase characters for user passwords."
  type        = bool
  default     = true
}

variable "require_numbers" {
  description = "Whether to require numbers for user passwords."
  type        = bool
  default     = true
}

variable "require_symbols" {
  description = "Whether to require symbols for user passwords."
  type        = bool
  default     = true
}

variable "require_uppercase" {
  description = "Whether to require uppercase characters for user passwords."
  type        = bool
  default     = true
}

variable "temporary_password_validity_days" {
  description = "Number of days a temporary password is valid."
  type        = number
  default     = 1
}

### verification_message_template block ###

variable "default_email_option" {
  description = "The email option. Must be either `CONFIRM_WITH_LINK` or `CONFIRM_WITH_CODE`. Defaults to `CONFIRM_WITH_CODE`."
  type        = string
  default     = "CONFIRM_WITH_CODE"
}

# Amazon Cognito User Pool Client
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client

variable "access_token_validity" {
  description = "Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used."
  type        = number
  default     = null
}

variable "allowed_oauth_flows" {
  description = "List of allowed OAuth flows (code, implicit, client_credentials)."
  type        = list(string)
  default     = []
}

variable "allowed_oauth_flows_user_pool_client" {
  description = "Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools."
  type        = bool
  default     = true
}

variable "allowed_oauth_scopes" {
  description = "List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin)."
  type        = list(string)
  default     = []
}

variable "callback_urls" {
  description = "List of allowed redirect (callback) URLs for the identity providers."
  type        = list(string)
  default     = []
}

variable "enable_token_revocation" {
  description = "Enables or disables token revocation."
  type        = bool
  default     = true
}

variable "explicit_auth_flows" {
  description = "List of authentication flows."
  type        = list(string)
  default     = []
}

variable "generate_secret" {
  description = "Should an application secret be generated."
  type        = bool
  default     = false
}

variable "id_token_validity" {
  description = "Time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used."
  type        = number
  default     = null
}

variable "logout_urls" {
  description = "List of allowed logout URLs for the identity providers."
  type        = list(string)
  default     = []
}

variable "user_pool_client_name" {
  description = "Name of the User Pool Client."
  type        = string
}

variable "read_attributes" {
  description = "List of user pool attributes the application client can read from."
  type        = list(string)
  default     = []
}

variable "refresh_token_validity" {
  description = "Time limit, between 60 minutes and 10 years, after which the refresh token is no longer valid and cannot be used."
  type        = number
  default     = null
}

variable "supported_identity_providers" {
  description = "List of provider names for the identity providers that are supported on this client."
  type        = list(string)
  default     = []
}

variable "write_attributes" {
  description = "List of user pool attributes the application client can write to."
  type        = list(string)
  default     = []
}

# Amazon Cognito User Pool Domain
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain

variable "certificate_arn" {
  description = "ARN of an ACM certificate in us-east-1 to be used for the custom domain."
  type        = string
  default     = null
}

variable "domain" {
  description = "Domain string."
  type        = string
}
