# --------------------------------------------------------------------------------
# Application Load Balancer モジュール アウトプット定義
# --------------------------------------------------------------------------------

output "security_group_id" {
  value = module.alb_sg.security_group.id
}

output "alb_target_group_arn" {
  value = module.alb.alb_target_group.arn
}
