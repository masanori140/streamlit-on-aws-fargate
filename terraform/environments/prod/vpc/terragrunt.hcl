# Terragrunt terraform
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform

terraform {
  source = "../../..//modules/vpc"
}

# Terragrunt include
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#include

include {
  path = find_in_parent_folders()
}
