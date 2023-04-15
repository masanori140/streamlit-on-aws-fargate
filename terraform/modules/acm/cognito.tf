module "cognito_acm" {
  source            = "../../resources/acm"
  domain_name       = "auth.${data.aws_route53_zone.this.name}"
  tags              = var.tags
  validation_method = "DNS"
  zone_id           = data.aws_route53_zone.this.zone_id
}
