# Streamlit on AWS Fargate with Terragrunt

このリポジトリでは、Streamlit を AWS Fargate 上で実行するための Terragrunt ソースコードです。<br>
以下の手順に従って、環境を構築してください。

## Requirements

| Name       | Version |
| ---------- | ------- |
| terraform  | 1.3.9   |
| terragrunt | 0.45.2  |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | 4.62.0  |

## アーキテクチャ図

[ここにリンクを貼ってください]

## 前提条件

- [AWS account](https://aws.amazon.com/) が作成済みであること
- [AWS CLI](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-chap-install.html) がインストール済みであること
- AWS Route53 にパブリックホストゾーンが登録済みであること

## 事前準備

1. AWS CLI を使用して、AWS アカウントにログインしてください。

```bash
aws configure
```

2. このリポジトリをローカル環境にクローンしてください。

```bash
git clone https://github.com/maishio/streamlit-on-aws-fargate.git
cd terraform/enviroments/prod
```

3. 必要なバージョンの Terraform と Terragrunt をインストールしてください。

4. [env.hcl](terraform/environments/prod/env.hcl) ファイルのローカル変数を、自分の環境に合わせて設定してください。

```hcl
locals {
  aws_account_id = "123456789012"
  aws_region_id  = "us-east-1"
  env            = "myEnv"
  hostzone       = "example.com"
  service        = "myService"
}
```

## デプロイ方法

1. 以下のコマンドを実行して、環境を初期化します。

```bash
terragrunt init
```

2. 以下のコマンドを実行して、インフラをデプロイします。

```bash
terragrunt plan
terragrunt apply
```

## デプロイの確認

1. デプロイ直後はタスク数が`0`です。以下のコマンドを実行してタスク数を`1`に変更してください。

```bash
aws ecs update-service --cluster YOUR_CLUSTER_NAME --service YOUR_SERVICE_NAME --desired-count 1
```

2. [Streamlit アプリを ECR にプッシュする](streamlit/README.md)を参考に、Streamlit アプリを ECR にプッシュしてください。

3. Streamlit アプリにログインするためのユーザーを作成してください。以下のコマンドを実行して、ユーザーを作成してください。

```bash
aws cognito-idp admin-create-user \
  --user-pool-id YOUR_USER_POOL_ID \
  --username USER_NAME \
  --user-attributes Name=email,Value=YOUR_EMAIL_ADDRESS \
  --temporary-password YOUR_TEMPORARY_PASSWORD
```

4. 以下の URL にアクセスして、Streamlit の画面が表示されることを確認してください。

https://YOUR_DOMAIN_NAME

5. 以下の画面が表示されれば正常です。

[ここに画像を貼ってください]

## 環境の削除

環境を削除する場合は、以下のコマンドを実行してください。

```bash
terragrunt destroy
```

## 注意事項

本リポジトリのコードはデモ用途であり、本番環境での使用は推奨されません。本番環境での使用を検討する場合は、セキュリティやパフォーマンス等の面で適切な設定を行ってください。
