# --------------------------------------------------------------------------------
# Amazon Route53 Record 属性定義
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
# --------------------------------------------------------------------------------

variable "alias" {
  description = "Dynamic block for create alias records."
  type        = list(any)
  default     = []
}

variable "name" {
  description = "Name of the record."
  type        = string
}

variable "records" {
  description = "A string list of records."
  type        = list(string)
  default     = []
}

variable "ttl" {
  description = "TTL of the record."
  type        = number
  default     = 300
}

variable "type" {
  description = "Type of the record."
  type        = string
}

variable "zone_id" {
  description = "ID of the hosted zone to contain this record."
  type        = string
}
