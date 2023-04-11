# AWS ACM Certificate
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate

resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  tags                      = merge(var.tags, { "Name" = var.domain_name })
}

# AWS ACM Certificate Validation
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.this : record.fqdn]
}

# Amazon Route53 Record
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record

resource "aws_route53_record" "this" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = var.allow_overwrite
  name            = each.value.name
  records         = [each.value.record]
  ttl             = var.ttl
  type            = each.value.type
  zone_id         = var.zone_id
}
