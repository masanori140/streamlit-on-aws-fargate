# Elastic Load Balancer
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

variable "access_logs" {
  description = "A list of access_logs objects for the dynamic block."
  type        = list(map(string))
  default     = []
}

variable "drop_invalid_header_fields" {
  description = "Indicates whether HTTP headers with invalid header fields are removed by the load balancer (true) or routed to targets (false). Defaults to `false`."
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "Indicates whether cross-zone load balancing is enabled. Defaults to `false`."
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "Indicates whether deletion protection is enabled. Defaults to `false`."
  type        = bool
  default     = false
}

variable "enable_http2" {
  description = "Indicates whether HTTP/2 is enabled. Defaults to `true`."
  type        = bool
  default     = true
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle. Defaults to `60`."
  type        = number
  default     = 60
}

variable "internal" {
  description = "If true, the LB will be internal."
  type        = bool
  default     = false
}

variable "ip_address_type" {
  description = "Type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4`and `dualstack`."
  type        = string
  default     = "ipv4"
}

variable "load_balancer_type" {
  description = "Type of load balancer. Defaults to `application`."
  type        = string
  default     = "application"
}

variable "name" {
  description = "Name of the load balancer."
  type        = string
  default     = null
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the LB."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the LB."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resource. "
  type        = map(string)
  default     = {}
}
