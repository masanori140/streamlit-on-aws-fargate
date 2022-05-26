# --------------------------------------------------------------------------------
# Amazon ECR モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository
# --------------------------------------------------------------------------------

module "ecr" {
  source = "git::https://github.com/norishio2022/terraform-aws-resources.git//ecr"
  name   = "${var.tags.service}-${var.tags.env}-streamlit-app"
  path   = "${path.module}/files/template/ecr_lifecycle_policy.json.tpl"
  tags   = var.tags
}

# --------------------------------------------------------------------------------
# Null Resource
# @see https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource
# 
# ※ ECRリポジトリが新規作成された場合のみダミーのDockerイメージをECRリポジトリにプッシュする
# --------------------------------------------------------------------------------

resource "null_resource" "this" {
  triggers = {
    arn = module.ecr.ecr_repository.arn
  }
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ${var.region.id} | docker login --username AWS --password-stdin ${var.account.id}.dkr.ecr.${var.region.id}.amazonaws.com
      docker build --platform amd64 -f files/docker/Dockerfile -t ${var.account.id}.dkr.ecr.${var.region.id}.amazonaws.com/${var.tags.service}-${var.tags.env}-streamlit-app:latest .
      docker push ${var.account.id}.dkr.ecr.${var.region.id}.amazonaws.com/${var.tags.service}-${var.tags.env}-streamlit-app:latest
    EOT 
  }
  depends_on = [module.ecr.aws_ecr_repository]
}
