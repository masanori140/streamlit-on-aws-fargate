# ELB Service Account Data Source
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account

data "aws_elb_service_account" "this" {}

# Amazon Route53 Public Hosted zone Data Source
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone

data "aws_route53_zone" "this" {
  name         = var.hostzone.name
  private_zone = false
}
