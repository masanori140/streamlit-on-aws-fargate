# Amazon ECS Task Execution Role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role

data "aws_iam_role" "this" {
  name = "ecsTaskExecutionRole"
}
