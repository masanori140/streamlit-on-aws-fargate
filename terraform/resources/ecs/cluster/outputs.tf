# Amazon ECS Cluster
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster

output "ecs_cluster" {
  description = "Amazon ECS Cluster resource."
  value       = aws_ecs_cluster.this
}
