# --------------------------------------------------------------------------------
# AWS ACM モジュール（ALB用）
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate
# --------------------------------------------------------------------------------

module "alb_acm" {
  source            = "git::https://github.com/norishio2022/terraform-aws-resources.git//acm"
  domain_name       = data.aws_route53_zone.this.name
  validation_method = "DNS"
  zone_id           = data.aws_route53_zone.this.zone_id
}

# --------------------------------------------------------------------------------
# AWS ACM モジュール（Cognito用）
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate
# --------------------------------------------------------------------------------

module "cognito_acm" {
  source            = "git::https://github.com/norishio2022/terraform-aws-resources.git//acm"
  domain_name       = "auth.${data.aws_route53_zone.this.name}"
  validation_method = "DNS"
  zone_id           = data.aws_route53_zone.this.zone_id
  providers = {
    aws = aws.us-east-1
  }
}
