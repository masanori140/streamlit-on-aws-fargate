# Amazon Cognito User Pool Domain Terraform Resource

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.3.0 |

## Providers

| Name | Version   |
|------|-----------|
| aws  | ~> 4.57.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cognito_user_pool_domain.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ARN of an ACM certificate in us-east-1 to be used for the custom domain. | `string` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain string. | `string` | n/a | yes |
| <a name="input_user_pool_id"></a> [user\_pool\_id](#input\_user\_pool\_id) | The user pool ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cognito_user_pool_domain"></a> [cognito\_user\_pool\_domain](#output\_cognito\_user\_pool\_domain) | Amazon Cognito User Pool Domain resource. |
