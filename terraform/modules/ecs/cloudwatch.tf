module "cloudwatch" {
  source            = "../../resources/cloudwatch"
  name              = "/aws/ecs/${var.tags.service}-${var.tags.env}-streamlit"
  retention_in_days = 7
  tags              = var.tags
}
