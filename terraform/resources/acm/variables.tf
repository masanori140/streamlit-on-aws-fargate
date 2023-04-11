# AWS ACM Certificate
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate

variable "domain_name" {
  description = "The domain name for which you want to request a certificate."
  type        = string
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate."
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "The method to validate certificate."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

# Amazon Route53 Record
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record

variable "allow_overwrite" {
  description = "Allow Terraform to overwrite an existing record when creating."
  type        = bool
  default     = true
}

variable "ttl" {
  description = "The TTL of the record."
  type        = number
  default     = 300
}

variable "zone_id" {
  description = "The ID of the hosted zone to contain this record."
  type        = string
}
