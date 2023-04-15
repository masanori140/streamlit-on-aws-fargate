# Amazon ECS Service
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service

output "ecs_service" {
  description = "Amazon ECS Service resource."
  value       = aws_ecs_service.this
}
