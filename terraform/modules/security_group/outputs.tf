output "alb_security_group_id" {
  description = "ALB security group ID"
  value       = module.alb_sg.security_group.id
}

output "ecs_security_group_id" {
  description = "ECS security group ID"
  value       = module.ecs_sg.security_group.id
}
