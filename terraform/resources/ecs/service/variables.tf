# Amazon ECS Service
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service

variable "cluster" {
  description = "ARN of the cluster in which to run the service."
  type        = string
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  type        = number
  default     = 0
}

variable "health_check_grace_period_seconds" {
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. "
  type        = number
  default     = 0
}

variable "launch_type" {
  description = "Launch type on which to run your service. The valid values are `EC2`, `FARGATE`, and `EXTERNAL`. Defaults to `EC2`."
  type        = string
  default     = "EC2"
}

variable "name" {
  description = "Name of the service."
  type        = string
}

variable "propagate_tags" {
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks."
  type        = string
  default     = "TASK_DEFINITION"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "task_family" {
  description = "Name of the task definition."
  type        = string
}

### Capacity Provider Strategy ###

variable "capacity_provider_strategy" {
  description = "Dynamic block for the capacity provider strategy."
  type        = list(map(string))
  default     = []
}

### Deployment Controller ###

variable "deployment_controller_type" {
  description = "Type of deployment controller. Defaults to `ECS`."
  type        = string
  default     = "ECS"
}

### Load Balancer ###

variable "load_balancer" {
  description = "Dynamic block for the load balancer."
  type        = list(map(string))
  default     = []
}

### Network Configuration ###

variable "assign_public_ip" {
  description = "Assign a public IP address to the ENI (Fargate launch type only)."
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "List of security group IDs to assign to the ENI."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "Subnets associated with the task or service."
  type        = list(string)
  default     = []
}

### Service Registries ###

variable "service_registries" {
  description = "Dynamic block for the service registries."
  type        = list(map(string))
  default     = []
}
