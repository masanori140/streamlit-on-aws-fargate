# Amazon ECS Task Definition
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition

resource "aws_ecs_task_definition" "this" {
  container_definitions    = templatefile(var.path, var.vars)
  cpu                      = var.cpu
  execution_role_arn       = var.execution_role_arn
  family                   = var.family
  memory                   = var.memory
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  tags                     = merge(var.tags, { "Name" = var.family })
  task_role_arn            = var.task_role_arn

  dynamic "volume" {
    for_each = var.volume
    content {
      name = volume.value.name
      dynamic "efs_volume_configuration" {
        for_each = volume.value.efs_volume_configuration
        content {
          file_system_id          = efs_volume_configuration.value.file_system_id
          root_directory          = lookup(efs_volume_configuration.value, "root_directory", "/")
          transit_encryption      = lookup(efs_volume_configuration.value, "transit_encryption", "ENABLED")
          transit_encryption_port = lookup(efs_volume_configuration.value, "transit_encryption_port", null)
          dynamic "authorization_config" {
            for_each = efs_volume_configuration.value.authorization_config
            content {
              access_point_id = authorization_config.value.access_point_id
              iam             = lookup(authorization_config.value, "iam", "DISABLED")
            }
          }
        }
      }
    }
  }
}
