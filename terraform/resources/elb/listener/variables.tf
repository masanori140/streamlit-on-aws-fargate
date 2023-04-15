# Elastic Load Balancer Listener
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

variable "certificate_arn" {
  description = "ARN of the default SSL server certificate."
  type        = string
  default     = null
}

variable "default_action" {
  description = "A list of default action objects for the dynamic block."
  type        = any
  default     = []
}

variable "load_balancer_arn" {
  description = "ARN of the load balancer."
  type        = string
}

variable "port" {
  description = "Port on which the load balancer is listening."
  type        = string
  default     = null
}

variable "protocol" {
  description = "Protocol for connections from clients to the load balancer."
  type        = string
  default     = null
}

variable "ssl_policy" {
  description = "Name of the SSL Policy for the listener."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
