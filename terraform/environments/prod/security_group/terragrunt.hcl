# Terragrunt terraform
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform

terraform {
  source = "../../..//modules/security_group"
}

# Terragrunt include
# @see https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#include

include {
  path = find_in_parent_folders()
}

# Terragrunt dependency
# @see https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
  }
}

# Terragrunt inputs
# https://terragrunt.gruntwork.io/docs/features/inputs/#inputs

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}
