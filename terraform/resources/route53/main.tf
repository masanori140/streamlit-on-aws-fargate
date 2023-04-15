# Amazon Route53 Record
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record

resource "aws_route53_record" "this" {
  name    = var.name
  records = var.records
  ttl     = var.ttl
  type    = var.type
  zone_id = var.zone_id

  # Dynamic block for create alias records

  dynamic "alias" {
    for_each = lookup(each.value, "alias", [])
    content {
      evaluate_target_health = lookup(alias.value, "evaluate_target_health", true)
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
    }
  }
}
