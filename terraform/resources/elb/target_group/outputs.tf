# Elastic Load Balancer Target Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

output "elb_target_group" {
  value = aws_lb_target_group.this
}
