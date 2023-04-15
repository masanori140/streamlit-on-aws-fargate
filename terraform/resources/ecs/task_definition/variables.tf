# Amazon ECS Task Definition
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition

variable "cpu" {
  description = "The number of cpu units used by the task."
  type        = string
  default     = "256"
}

variable "execution_role_arn" {
  description = "ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
  type        = string
  default     = null
}

variable "family" {
  description = "A unique name for your task definition."
  type        = string
}

variable "memory" {
  description = "Amount (in MiB) of memory used by the task."
  type        = string
  default     = "512"
}

variable "network_mode" {
  description = "Docker networking mode to use for the containers in the task."
  type        = string
  default     = "awsvpc"
}

variable "path" {
  description = "Path to the task definition template."
  type        = string
  default     = null
}

variable "requires_compatibilities" {
  description = "Set of launch types required by the task. Valid values are `EC2` and `FARGATE`."
  type        = list(string)
  default     = ["FARGATE"]
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "task_role_arn" {
  description = "ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services."
  type        = string
  default     = null
}

variable "vars" {
  description = "Variables to pass to the task definition template."
  type        = map(string)
  default     = {}
}

variable "volume" {
  description = "Dynamic block for the volume."
  type        = any
  default     = []
}
