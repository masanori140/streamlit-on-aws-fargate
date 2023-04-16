# Terragrunt terraform
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform

terraform {
  source = "../../..//modules/alb"
}

# Terragrunt include
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#include

include {
  path = find_in_parent_folders()
}

# Terragrunt dependency
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency

dependency "acm" {
  config_path = "../acm"

  mock_outputs = {
    alb_acm_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    cognito_acm_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  }
}

# Terragrunt dependency
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency

dependency "security_group" {
  config_path = "../security_group"

  mock_outputs = {
    alb_security_group_id = "sg-xxxxxxxxxxxxxxxxx"
  }
}

# Terragrunt dependency
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    public_subnet_ids = ["subnet-xxxxxxxxxxxxxxxxx"]
    vpc_id            = "vpc-xxxxxxxxxxxxxxxxx"
  }
}

# Terragrunt inputs
# @see https://terragrunt.gruntwork.io/docs/features/inputs/#inputs

inputs = {
  alb_acm_certificate_arn     = dependency.acm.outputs.alb_acm_certificate_arn
  cognito_acm_certificate_arn = dependency.acm.outputs.cognito_acm_certificate_arn
  security_groups             = [dependency.security_group.outputs.alb_security_group_id]
  subnets                     = dependency.vpc.outputs.public_subnet_ids
  vpc_id                      = dependency.vpc.outputs.vpc_id
}
