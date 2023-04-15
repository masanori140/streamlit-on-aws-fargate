# Amazon ECR
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository

variable "force_delete" {
  description = "If true, will delete the repository even if it contains images."
  type        = bool
  default     = false
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE."
  type        = string
  default     = "MUTABLE"
}

variable "name" {
  description = "Name of the repository."
  type        = string
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not (false)."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

# Amazon ECR Lifecycle Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy

variable "path" {
  description = "Path to the lifecycle policy template."
  type        = string
}

variable "vars" {
  description = "Variables to pass to the lifecycle policy template."
  type        = map(string)
  default     = {}
}
