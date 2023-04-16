module "iam_role" {
  source      = "../../resources/iam/role"
  description = "Amazon ECS task execution role"
  name        = "${var.tags.service}-${var.tags.env}-task-execution-role"
  path        = "${path.module}/files/template/default_iam_assume_role.json.tpl"
  vars = {
    SERVICE = "ecs-tasks.amazonaws.com"
  }
  tags = var.tags
}

module "iam_policy" {
  source                            = "../../resources/iam/policy"
  create_iam_role_policy_attachment = true
  description                       = "Amazon ECS task execution policy"
  name                              = "${var.tags.service}-${var.tags.env}-task-execution-policy"
  role                              = module.iam_role.iam_role.name
  path                              = "${path.module}/files/template/ecs_task_execution_policy.json.tpl"
  vars = {
    REPOSITORY_ARN = module.ecr.ecr_repository.arn
  }
  tags = var.tags
}
