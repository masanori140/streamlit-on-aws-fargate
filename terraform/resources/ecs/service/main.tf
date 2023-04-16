# Amazon ECS Service
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service

resource "aws_ecs_service" "this" {
  cluster                           = var.cluster
  desired_count                     = var.desired_count
  health_check_grace_period_seconds = var.health_check_grace_period_seconds
  launch_type                       = var.capacity_provider_strategy == [] ? var.launch_type : null
  name                              = var.name
  propagate_tags                    = var.propagate_tags
  tags                              = merge(var.tags, { "Name" = var.name })
  task_definition                   = var.task_family

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      base              = capacity_provider_strategy.value.base
      capacity_provider = capacity_provider_strategy.value.capacity_provider
      weight            = capacity_provider_strategy.value.weight
    }
  }

  deployment_controller {
    type = var.deployment_controller_type
  }

  dynamic "load_balancer" {
    for_each = var.load_balancer
    content {
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
      target_group_arn = load_balancer.value.target_group_arn
    }
  }

  network_configuration {
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_groups
    subnets          = var.subnets
  }

  dynamic "service_registries" {
    for_each = var.service_registries
    content {
      container_port = service_registries.value.container_port
      port           = service_registries.value.port
      registry_arn   = service_registries.value.registry_arn
    }
  }

  lifecycle {
    ignore_changes = [
      desired_count,
      load_balancer,
      task_definition,
    ]
  }
}
