# Elastic Load Balancer
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

resource "aws_lb" "this" {
  drop_invalid_header_fields       = var.drop_invalid_header_fields
  enable_cross_zone_load_balancing = var.load_balancer_type == "application" ? var.enable_cross_zone_load_balancing : null
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.load_balancer_type == "application" ? var.enable_http2 : null
  idle_timeout                     = var.load_balancer_type == "application" ? var.idle_timeout : null
  internal                         = var.internal
  ip_address_type                  = var.ip_address_type
  load_balancer_type               = var.load_balancer_type
  name                             = var.name
  security_groups                  = var.load_balancer_type == "application" ? var.security_groups : null
  subnets                          = var.subnets
  tags                             = merge(var.tags, { "Name" = var.name })

  dynamic "access_logs" {
    for_each = var.access_logs
    content {
      enabled = access_logs.value.enabled
      bucket  = access_logs.value.bucket
      prefix  = access_logs.value.prefix
    }
  }
}
