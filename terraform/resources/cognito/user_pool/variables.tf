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

variable "name" {
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
