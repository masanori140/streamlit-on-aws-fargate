# Amazon ECS Cluster
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster

variable "name" {
  description = "Name of the cluster."
  type        = string
}

variable "setting_name" {
  description = "Name of the setting to manage. Defaluts to `containerInsights`."
  type        = string
  default     = "containerInsights"
}

variable "setting_value" {
  description = "Value to assign to the setting. Defaults to `enabled`."
  type        = string
  default     = "enabled"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

# Amazon ECS Cluster Capacity Providers
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers

variable "capacity_providers" {
  description = "Set of names of one or more capacity providers to associate with the cluster."
  type        = list(string)
  default     = []
}

variable "default_capacity_provider_strategy" {
  description = "Dynamic block for the default capacity provider strategy blcok."
  type        = list(map(string))
  default     = []
}
