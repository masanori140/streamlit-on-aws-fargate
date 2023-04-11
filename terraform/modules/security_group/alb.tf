module "alb_sg" {
  source              = "../../resources/security_group"
  security_group_name = "${var.tags.service}-${var.tags.env}-alb-sg"
  tags                = var.tags
  vpc_id              = var.vpc_id
  ingress_rule = {
    0 = {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Internet"
      from_port   = 443
      protocol    = "tcp"
      to_port     = 443
    }
  }
}
