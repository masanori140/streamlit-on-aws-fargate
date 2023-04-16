# AWS IAM Role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

variable "description" {
  description = "Description of the IAM role."
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the IAM role."
  type        = string
}

variable "path" {
  description = "Path to the IAM role policy."
  type        = string
}

variable "vars" {
  description = "Variables to be used in the IAM role policy."
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

variable "policies" {
  description = "List of IAM policies to attach to the IAM role."
  type        = list(string)
  default     = []
}
