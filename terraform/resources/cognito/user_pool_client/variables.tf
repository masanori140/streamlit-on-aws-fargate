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

variable "name" {
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

variable "user_pool_id" {
  description = "User pool ID."
  type        = string
}

variable "write_attributes" {
  description = "List of user pool attributes the application client can write to."
  type        = list(string)
  default     = []
}
