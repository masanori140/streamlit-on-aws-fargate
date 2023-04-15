module "alb" {
  source          = "../../resources/elb/elb"
  internal        = false
  name            = "${var.tags.service}-${var.tags.env}-alb"
  security_groups = var.security_groups
  subnets         = var.subnets
  tags            = var.tags
  access_logs = [
    {
      bucket  = module.s3.s3_bucket.id
      enabled = true
      prefix  = "alb/${var.tags.service}-${var.tags.env}-alb"
    }
  ]
}

module "target_group" {
  source                = "../../resources/elb/target_group"
  health_check_interval = 60
  health_check_matcher  = "200"
  health_check_path     = "/"
  health_check_port     = 80
  health_check_timeout  = 10
  name                  = "${var.tags.service}-${var.tags.env}-target-group"
  port                  = 80
  protocol              = "HTTP"
  tags                  = var.tags
  target_type           = "ip"
  vpc_id                = var.vpc_id
}

module "alb_listener" {
  source          = "../../resources/elb/listener"
  certificate_arn = var.alb_acm_certificate_arn
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
      target_group_arn = module.target_group.elb_target_group.arn
      type             = "forward"
    }
  ]
  load_balancer_arn = module.alb.elb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  tags              = var.tags
}
