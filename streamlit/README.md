# Streamlit App on AWS Fargate

## Build

```
% cd /path/to/streamlit-on-aws-fargate/streamlit
% docker build --platform amd64 -t <aws_account_id>.dkr.ecr.<aws_region_id>.amazonaws.com/<service>-<env>-streamlit-app:latest .
```

## Push ECR

```
% aws ecr get-login-password --region <aws_region_id> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<aws_region_id>.amazonaws.com
% docker push <aws_account_id>.dkr.ecr.<aws_region_id>.amazonaws.com/<service>-<env>-streamlit-app:latest
```
