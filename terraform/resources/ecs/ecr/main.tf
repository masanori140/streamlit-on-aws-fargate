# Amazon ECR
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository

resource "aws_ecr_repository" "this" {
  force_delete         = var.force_delete
  image_tag_mutability = var.image_tag_mutability
  name                 = var.name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  tags = merge(var.tags, { "Name" = var.name })
}

# Amazon ECR Lifecycle Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy

resource "aws_ecr_lifecycle_policy" "this" {
  policy     = templatefile(var.path, var.vars)
  repository = aws_ecr_repository.this.name
}
