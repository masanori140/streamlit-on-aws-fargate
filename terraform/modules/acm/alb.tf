module "alb_acm" {
  source            = "../../resources/acm"
  domain_name       = data.aws_route53_zone.this.name
  validation_method = "DNS"
  zone_id           = data.aws_route53_zone.this.zone_id
}
