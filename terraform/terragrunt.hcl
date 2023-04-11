# local variables

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  aws_account_id   = local.environment_vars.locals.aws_account_id
  aws_region_id    = local.environment_vars.locals.aws_region_id
  env              = local.environment_vars.locals.env
  hostzone         = local.environment_vars.locals.hostzone
  service          = local.environment_vars.locals.service
}

# provider.tf template

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  allowed_account_ids = ["${local.aws_account_id}"]
  region              = "${local.aws_region_id}"
}
EOF
}

# backend.tf template

remote_state {
  backend = "s3"
  config = {
    bucket  = "streamlit-on-aws-fargate-tfstate-${local.aws_account_id}"
    encrypt = true
    key     = "tfstate/${local.service}/${local.env}/${basename(get_terragrunt_dir())}.tfstate"
    region  = local.aws_region_id
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# global variables

inputs = {
  account = {
    id = local.aws_account_id
  },
  hostzone = {
    name = local.hostzone
  },
  region = {
    id = local.aws_region_id
  },
  tags = {
    env     = local.env
    service = local.service
  }
}
