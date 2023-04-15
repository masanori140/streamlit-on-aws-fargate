# Elastic Load Balancer Listener
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

resource "aws_lb_listener" "this" {
  certificate_arn   = var.certificate_arn
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol
  ssl_policy        = var.ssl_policy
  tags              = var.tags

  dynamic "default_action" {
    for_each = var.default_action
    content {
      target_group_arn = lookup(default_action.value, "target_group_arn", null)
      type             = default_action.value.type

      dynamic "authenticate_cognito" {
        for_each = lookup(default_action.value, "authenticate_cognito", [])
        content {
          user_pool_arn       = lookup(authenticate_cognito.value, "user_pool_arn", null)
          user_pool_client_id = lookup(authenticate_cognito.value, "user_pool_client_id", null)
          user_pool_domain    = lookup(authenticate_cognito.value, "user_pool_domain", null)
        }
      }

      dynamic "fixed_response" {
        for_each = lookup(default_action.value, "fixed_response", [])
        content {
          content_type = lookup(fixed_response.value, "content_type", null)
          message_body = lookup(fixed_response.value, "message_body", null)
          status_code  = lookup(fixed_response.value, "status_code", null)
        }
      }
    }
  }
}
