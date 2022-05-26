# --------------------------------------------------------------------------------
# Amazon ECS on AWS Fargate Security Group モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# --------------------------------------------------------------------------------

module "ecs_sg" {
  source              = "git::https://github.com/norishio2022/terraform-aws-resources.git//security_group"
  security_group_name = "${var.tags.service}-${var.tags.env}-ecs-sg"
  tags                = var.tags
  vpc_id              = var.vpc_id
  ingress_rule = {
    0 = {
      description              = "alb"
      from_port                = 80
      protocol                 = "tcp"
      source_security_group_id = var.security_group_id
      to_port                  = 80
    }
  }
}

# --------------------------------------------------------------------------------
# Amazon ECS on AWS Fargate 構築 Terraform テンプレート
# --------------------------------------------------------------------------------

module "ecs" {
  source = "git::https://github.com/norishio2022/terraform-aws-resources.git//ecs"

  # --------------------------------------------------------------------------------
  # Amazon CloudWatch Log Group 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group
  # --------------------------------------------------------------------------------

  log_group_name = "/aws/ecs/${var.tags.service}-${var.tags.env}-streamlit-app"
  tags           = var.tags

  # --------------------------------------------------------------------------------
  # Amazon ECS Cluster 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster
  # --------------------------------------------------------------------------------

  ecs_cluster_name = "${var.tags.service}-${var.tags.env}-streamlit-cluster"

  # --------------------------------------------------------------------------------
  # Amazon ECS Service 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service
  # --------------------------------------------------------------------------------

  desired_count                         = 1
  ecs_service_name                      = "${var.tags.service}-${var.tags.env}-streamlit-app"
  network_configuration_security_groups = [module.ecs_sg.security_group.id]
  network_configuration_subnets         = var.subnet_ids

  capacity_provider_strategy = [
    {
      base              = 0
      capacity_provider = "FARGATE_SPOT"
      weight            = 0
    },
    {
      base              = 1
      capacity_provider = "FARGATE"
      weight            = 1
    }
  ]

  load_balancer = [
    {
      container_name   = "${var.tags.service}-${var.tags.env}-streamlit-app"
      container_port   = 80
      target_group_arn = var.alb_target_group_arn
    }
  ]

  # --------------------------------------------------------------------------------
  # Amazon ECS Task Definition 属性値
  # @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition
  # --------------------------------------------------------------------------------

  cpu                      = "1024"
  ecs_task_definition_name = "${var.tags.service}-${var.tags.env}-streamlit-app"
  execution_role_arn       = data.aws_iam_role.this.arn
  family                   = "${var.tags.service}-${var.tags.env}-streamlit-app"
  memory                   = "2048"
  templatefile             = "${path.module}/files/template/task_definition.json.tpl"
  parameters = {
    ENV            = var.tags.env
    REGION         = var.region.id
    REPOSITORY_URL = module.ecr.ecr_repository.repository_url
    SERVICE        = var.tags.service
  }
  depends_on = [null_resource.this]
}
