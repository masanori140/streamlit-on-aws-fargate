data "aws_route53_zone" "this" {
  name         = var.hostzone.name
  private_zone = false
}
