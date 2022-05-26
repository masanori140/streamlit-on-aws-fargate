# 環境構築手順

## 環境情報

- MacBook Pro（13-inch, M1, 2020）
- チップ： Apple M1
- OS： macOS Monterey（バージョン 12.4）

## Terraform

```
% brew install tfenv
% tfenv --version
tfenv 2.2.3

% tfenv install 1.1.9
% tfenv use 1.1.9
% terraform version
Terraform v1.1.9
on darwin_arm64
```

## Terragrunt

```
$ sudo wget -q -O /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.37.1/terragrunt_darwin_amd64
$ sudo chmod 755 /usr/local/bin/terragrunt
$ terragrunt -version
terragrunt version v0.37.1
```

## AWS CLI

- AWS CLIv2のインストール手順は、[コチラ](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)を参照ください。
- インストール完了後、aws configureコマンドを実行してください。

```
$ aws configure
AWS Access Key ID [****************ABCD]:     <- AWS Access Key IDを入力
AWS Secret Access Key [****************WXYZ]: <- AWS Secret access Keyを入力
Default region name [ap-northeast-1]:         <- リソースを作成するリージョンIDを入力
Default output format [json]:                 <- json を入力
```

## References

- [tfutils/tfenv](https://github.com/tfutils/tfenv)
- [Terragrunt Getting started](https://terragrunt.gruntwork.io/docs/#getting-started)
- [AWS Command Line Interface バージョン2用ユーザーガイド](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)
