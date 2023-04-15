module "route53" {
  source      = "../../resources/route53"
  record_name = "auth.${data.aws_route53_zone.this.name}"
  type        = "A"
  zone_id     = data.aws_route53_zone.this.zone_id
}
