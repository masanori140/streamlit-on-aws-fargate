output "alb_target_group_arn" {
  description = "ARN of the ALB target group."
  value       = module.target_group.elb_target_group.arn
}
