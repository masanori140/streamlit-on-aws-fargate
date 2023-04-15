module "alb_record" {
  source = "../../resources/route53"
  alias = [
    {
      evaluate_target_health = false
      name                   = module.alb.elb.dns_name
      zone_id                = module.alb.elb.zone_id
    }
  ]
  name    = data.aws_route53_zone.this.name
  type    = "A"
  zone_id = data.aws_route53_zone.this.zone_id
}
