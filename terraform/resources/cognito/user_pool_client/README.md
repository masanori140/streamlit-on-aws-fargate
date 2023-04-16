# Amazon Cognito User Pool Client Terraform Resource

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
| [aws_cognito_user_pool_client.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token_validity"></a> [access\_token\_validity](#input\_access\_token\_validity) | Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. | `number` | `null` | no |
| <a name="input_allowed_oauth_flows"></a> [allowed\_oauth\_flows](#input\_allowed\_oauth\_flows) | List of allowed OAuth flows (code, implicit, client\_credentials). | `list(string)` | `[]` | no |
| <a name="input_allowed_oauth_flows_user_pool_client"></a> [allowed\_oauth\_flows\_user\_pool\_client](#input\_allowed\_oauth\_flows\_user\_pool\_client) | Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools. | `bool` | `true` | no |
| <a name="input_allowed_oauth_scopes"></a> [allowed\_oauth\_scopes](#input\_allowed\_oauth\_scopes) | List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin). | `list(string)` | `[]` | no |
| <a name="input_callback_urls"></a> [callback\_urls](#input\_callback\_urls) | List of allowed redirect (callback) URLs for the identity providers. | `list(string)` | `[]` | no |
| <a name="input_enable_token_revocation"></a> [enable\_token\_revocation](#input\_enable\_token\_revocation) | Enables or disables token revocation. | `bool` | `true` | no |
| <a name="input_explicit_auth_flows"></a> [explicit\_auth\_flows](#input\_explicit\_auth\_flows) | List of authentication flows. | `list(string)` | `[]` | no |
| <a name="input_generate_secret"></a> [generate\_secret](#input\_generate\_secret) | Should an application secret be generated. | `bool` | `false` | no |
| <a name="input_id_token_validity"></a> [id\_token\_validity](#input\_id\_token\_validity) | Time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used. | `number` | `null` | no |
| <a name="input_logout_urls"></a> [logout\_urls](#input\_logout\_urls) | List of allowed logout URLs for the identity providers. | `list(string)` | `[]` | no |
| <a name="input_read_attributes"></a> [read\_attributes](#input\_read\_attributes) | List of user pool attributes the application client can read from. | `list(string)` | `[]` | no |
| <a name="input_refresh_token_validity"></a> [refresh\_token\_validity](#input\_refresh\_token\_validity) | Time limit, between 60 minutes and 10 years, after which the refresh token is no longer valid and cannot be used. | `number` | `null` | no |
| <a name="input_supported_identity_providers"></a> [supported\_identity\_providers](#input\_supported\_identity\_providers) | List of provider names for the identity providers that are supported on this client. | `list(string)` | `[]` | no |
| <a name="input_user_pool_client_name"></a> [user\_pool\_client\_name](#input\_user\_pool\_client\_name) | Name of the User Pool Client. | `string` | n/a | yes |
| <a name="input_user_pool_id"></a> [user\_pool\_id](#input\_user\_pool\_id) | User pool ID. | `string` | n/a | yes |
| <a name="input_write_attributes"></a> [write\_attributes](#input\_write\_attributes) | List of user pool attributes the application client can write to. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cognito_user_pool_client"></a> [cognito\_user\_pool\_client](#output\_cognito\_user\_pool\_client) | Amazon Cognito User Pool Client resource. |
