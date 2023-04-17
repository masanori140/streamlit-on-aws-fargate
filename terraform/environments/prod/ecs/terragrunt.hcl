# Terragrunt terraform
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform

terraform {
  source = "../../..//modules/ecs"
}

# Terragrunt include
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#include

include {
  path = find_in_parent_folders()
}

# Terragrunt dependency
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency

dependency "alb" {
  config_path = "../alb"

  mock_outputs = {
    alb_target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-1:123456789012:targetgroup/xxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxx"
  }
}

# Terragrunt dependency
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency

dependency "security_group" {
  config_path = "../security_group"

  mock_outputs = {
    ecs_security_group_id = "sg-xxxxxxxxxxxxxxxxx"
  }
}

# Terragrunt dependency
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    private_subnet_ids = ["subnet-xxxxxxxxxxxxxxxxx"]
    vpc_id             = "vpc-xxxxxxxxxxxxxxxxx"
  }
}

# Terragrunt inputs
# https://terragrunt.gruntwork.io/docs/features/inputs/#inputs

inputs = {
  target_group_arn = dependency.alb.outputs.alb_target_group_arn
  security_groups  = [dependency.security_group.outputs.ecs_security_group_id]
  subnets          = dependency.vpc.outputs.private_subnet_ids
  vpc_id           = dependency.vpc.outputs.vpc_id
}
