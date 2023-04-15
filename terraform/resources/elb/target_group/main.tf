# Elastic Load Balancer Target Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

resource "aws_lb_target_group" "this" {
  deregistration_delay               = var.deregistration_delay
  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  name                               = var.name
  port                               = var.port
  protocol                           = var.protocol
  proxy_protocol_v2                  = var.proxy_protocol_v2
  slow_start                         = var.slow_start
  tags                               = merge(var.tags, { "Name" = var.name })
  target_type                        = var.target_type
  vpc_id                             = var.vpc_id

  health_check {
    enabled             = var.health_check_enabled
    healthy_threshold   = var.health_check_healthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  stickiness {
    cookie_duration = var.stickiness_cookie_duration
    enabled         = var.stickiness_enabled
    type            = var.stickiness_type
  }

  lifecycle {
    create_before_destroy = true
  }
}
