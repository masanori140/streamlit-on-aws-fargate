# Elastic Load Balancer Target Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused."
  type        = number
  default     = 300
}

variable "lambda_multi_value_headers_enabled" {
  description = "Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings."
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the target group."
  type        = string
}

variable "port" {
  description = "Port on which targets receive traffic, unless overridden when registering a specific target."
  type        = number
  default     = null
}

variable "protocol" {
  description = "Protocol to use for routing traffic to the targets."
  type        = string
  default     = null
}

variable "proxy_protocol_v2" {
  description = " Whether to enable support for proxy protocol v2 on Network Load Balancers. Defaults to `false`."
  type        = bool
  default     = false
}

variable "slow_start" {
  description = "Amount time for targets to warm up before the load balancer sends them a full share of requests. "
  type        = number
  default     = 0
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "target_type" {
  description = "Type of target that you must specify when registering targets with this target group."
  type        = string
  default     = "instance"
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
  default     = null
}

### Health Check ###

variable "health_check_enabled" {
  description = "Whether health checks are enabled. Defaults to `true`."
  type        = bool
  default     = true
}

variable "health_check_healthy_threshold" {
  description = "Number of consecutive health check successes required before considering a target healthy. Defaults to `3`."
  type        = number
  default     = 3
}

variable "health_check_interval" {
  description = "Time between health checks. Defaults to `30`."
  type        = number
  default     = 30
}

variable "health_check_matcher" {
  description = "Response codes to use when checking for a healthy responses from a target."
  type        = string
  default     = null
}

variable "health_check_path" {
  description = "Destination for the health check request."
  type        = string
  default     = null
}

variable "health_check_port" {
  description = "Port the load balancer uses when performing health checks on targets."
  type        = string
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "Protocol the load balancer uses when performing health checks on targets. Defaults to `HTTP`."
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "Amount of time to wait when receiving a response from the health check, in seconds. Defaults to `5`."
  type        = number
  default     = 5
}

variable "health_check_unhealthy_threshold" {
  description = "Number of consecutive health check failures required before considering a target unhealthy. Defaults to `3`."
  type        = number
  default     = 3
}

### Stickiness ###

variable "stickiness_cookie_duration" {
  description = "Time period, in seconds, during which requests from a client should be routed to the same target. Defaults to `86400`."
  type        = number
  default     = 86400
}

variable "stickiness_enabled" {
  description = "Whether sticky sessions are enabled."
  type        = bool
  default     = false
}

variable "stickiness_type" {
  description = "Type of sticky sessions."
  type        = string
  default     = "lb_cookie"
}
