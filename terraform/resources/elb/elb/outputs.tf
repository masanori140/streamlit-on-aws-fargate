# Elastic Load Balancer
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

output "elb" {
  value = aws_lb.this
}
