# Amazon ECR
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository

module "ecr" {
  source = "../../resources/ecs/ecr"
  name   = "${var.tags.service}-${var.tags.env}-streamlit"
  path   = "${path.module}/files/template/ecr_lifecycle_policy.json.tpl"
  tags   = var.tags
}
