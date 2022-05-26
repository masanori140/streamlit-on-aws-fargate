# Streamlit App on AWS Fargate

## Requirements

|Name|Version|
|----|-------|
|terraform|~> 1.1.19|
|terragrunt|~> 0.37.1|

## Providers

|Name|Version|
|----|-------|
|aws|~> 4.14.0|

## 環境構築

- [環境構築手順](docs/setup.md)

## 前提条件

- Route53に任意のドメインをパブリックホストゾーンとして登録しておくこと

## 事前準備

### /path/to/streamlit-on-aws-fargate/terraform/terragrunt.hclの編集

環境に合わせてローカル変数の値を修正すること

```
# --------------------------------------------------------------------------------
# ローカル変数
# --------------------------------------------------------------------------------

locals {
  aws_account_id   = "123456789012"     <- AWSアカウントID
  aws_region_id    = "ap-northeast-1"   <- AWSリージョンID
  service          = "example"          <- AWSリソースに付与するserviceタグの値
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env              = local.environment_vars.locals.env
  hostzone         = local.environment_vars.locals.hostzone
}
```

### /path/to/streamlit-on-aws-fargate/terraform/environments/{env}/env.hclの編集

環境に合わせてローカル変数の値を修正すること

```
# --------------------------------------------------------------------------------
# ローカル変数
# --------------------------------------------------------------------------------

locals {
  env      = "prod"         <- AWSリソースに付与するenvタグの値
  hostzone = "example.com"  <- パブリックホストゾーン
}
```

## Terragruntの実行

### AWSリソースを作成

環境に合わせて{env}の部分を修正すること

```
% cd /path/to/streamlit-on-aws-fargate/terraform/envrironments/{env}
% terragrunt run-all init --terragrunt-non-interactive
% terragrunt run-all plan
% terragrunt run-all apply
```

### AWSリソースを削除

環境に合わせて{env}の部分を修正すること

```
% cd /path/to/streamlit-on-aws-fargate/terraform/envrironments/{env}
% terragrunt run-all destroy
```
