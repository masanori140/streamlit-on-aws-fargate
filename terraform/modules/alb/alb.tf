# --------------------------------------------------------------------------------
# Application Load Balancer Security Group モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# --------------------------------------------------------------------------------

module "alb_sg" {
  source              = "git::https://github.com/norishio2022/terraform-aws-resources.git//security_group"
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

# --------------------------------------------------------------------------------
# Application Load Balancer Terraform　テンプレート
# --------------------------------------------------------------------------------

module "alb" {
  source = "git::https://github.com/norishio2022/terraform-aws-resources.git//alb"

  # --------------------------------------------------------------------------------
  # Application Load Balancer 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
  # --------------------------------------------------------------------------------

  alb_name        = "${var.tags.service}-${var.tags.env}-alb"
  internal        = false
  security_groups = [module.alb_sg.security_group.id]
  subnets         = var.subnets
  tags            = var.tags
  access_logs = [
    {
      bucket  = module.s3.s3_bucket.id
      enabled = true
      prefix  = "alb/${var.tags.service}-${var.tags.env}-alb"
    }
  ]

  # --------------------------------------------------------------------------------
  # Application Load Balancer Target Group 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
  # --------------------------------------------------------------------------------

  health_check_matcher = "200"
  health_check_path    = "/"
  health_check_port    = 80
  health_check_timeout = 30
  target_group_name    = "${var.tags.service}-${var.tags.env}-target-group"
  target_port          = 80
  target_protocol      = "HTTP"
  target_type          = "ip"
  vpc_id               = var.vpc_id

  # --------------------------------------------------------------------------------
  # Application Load Balancer Listener 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
  # --------------------------------------------------------------------------------

  certificate_arn = module.alb_acm.acm_certificate.arn
  default_action = [
    {
      type = "authenticate-cognito"
      authenticate_cognito = [
        {
          user_pool_arn       = module.cognito.cognito_user_pool.arn
          user_pool_client_id = module.cognito.cognito_user_pool_client.id
          user_pool_domain    = module.cognito.cognito_user_pool_domain.domain
        }
      ]
    },
    {
      type             = "forward"
      target_group_arn = module.alb.alb_target_group.arn
    }
  ]
  listener_port     = "443"
  listener_protocol = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2020-10"

  # --------------------------------------------------------------------------------
  # Amazon Route53 Record 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
  # --------------------------------------------------------------------------------

  record_name = data.aws_route53_zone.this.name
  type        = "A"
  zone_id     = data.aws_route53_zone.this.zone_id
}
