# AWS IAM Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy

variable "description" {
  description = "Description of the policy."
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the policy."
  type        = string
  default     = null
}

variable "path" {
  description = "Path to the policy."
  type        = string
  default     = null
}

variable "vars" {
  description = "Variables to be used in the policy."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

# AWS IAM Role Policy Attachment
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment

variable "create_iam_role_policy_attachment" {
  description = "Whether to create the IAM role policy attachment."
  type        = bool
  default     = false
}

variable "role" {
  description = "Name of the IAM role to attach the policy to."
  type        = string
  default     = null
}
