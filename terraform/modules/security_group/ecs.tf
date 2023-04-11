module "ecs_sg" {
  source              = "../../resources/security_group"
  security_group_name = "${var.tags.service}-${var.tags.env}-ecs-sg"
  tags                = var.tags
  vpc_id              = var.vpc_id
  ingress_rule = {
    0 = {
      description              = "ALB"
      from_port                = 80
      protocol                 = "tcp"
      source_security_group_id = module.alb_sg.security_group.id
      to_port                  = 80
    }
  }
}
