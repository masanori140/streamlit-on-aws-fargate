# Elastic Load Balancer Listener
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

output "elb_listener" {
  value = aws_lb_listener.this
}
