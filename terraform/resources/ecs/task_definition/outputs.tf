# Amazon ECS Task Definition
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition

output "ecs_task_definition" {
  value = aws_ecs_task_definition.this
}
