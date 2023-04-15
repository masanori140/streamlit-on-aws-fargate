# Amazon Cognito Terraform Resource

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
| [aws_cognito_user_pool.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool) | resource |
| [aws_cognito_user_pool_client.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client) | resource |
| [aws_cognito_user_pool_domain.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token_validity"></a> [access\_token\_validity](#input\_access\_token\_validity) | Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. | `number` | `null` | no |
| <a name="input_allow_admin_create_user_only"></a> [allow\_admin\_create\_user\_only](#input\_allow\_admin\_create\_user\_only) | Set to `true` to allow only administrators to create user profiles. Set to `false` to allow non-administrators to create user profiles. | `bool` | `true` | no |
| <a name="input_allowed_oauth_flows"></a> [allowed\_oauth\_flows](#input\_allowed\_oauth\_flows) | List of allowed OAuth flows (code, implicit, client\_credentials). | `list(string)` | `[]` | no |
| <a name="input_allowed_oauth_flows_user_pool_client"></a> [allowed\_oauth\_flows\_user\_pool\_client](#input\_allowed\_oauth\_flows\_user\_pool\_client) | Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools. | `bool` | `true` | no |
| <a name="input_allowed_oauth_scopes"></a> [allowed\_oauth\_scopes](#input\_allowed\_oauth\_scopes) | List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin). | `list(string)` | `[]` | no |
| <a name="input_auto_verified_attributes"></a> [auto\_verified\_attributes](#input\_auto\_verified\_attributes) | Attributes to be auto-verified. Valid values are `email` and `phone_number`. | `list(string)` | `[]` | no |
| <a name="input_callback_urls"></a> [callback\_urls](#input\_callback\_urls) | List of allowed redirect (callback) URLs for the identity providers. | `list(string)` | `[]` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ARN of an ACM certificate in us-east-1 to be used for the custom domain. | `string` | `null` | no |
| <a name="input_default_email_option"></a> [default\_email\_option](#input\_default\_email\_option) | The email option. Must be either `CONFIRM_WITH_LINK` or `CONFIRM_WITH_CODE`. Defaults to `CONFIRM_WITH_CODE`. | `string` | `"CONFIRM_WITH_CODE"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain string. | `string` | n/a | yes |
| <a name="input_email_sending_account"></a> [email\_sending\_account](#input\_email\_sending\_account) | Email delivery method to use. Valid values are `COGNITO_DEFAULT` and `DEVELOPER`. | `string` | `"COGNITO_DEFAULT"` | no |
| <a name="input_enable_token_revocation"></a> [enable\_token\_revocation](#input\_enable\_token\_revocation) | Enables or disables token revocation. | `bool` | `true` | no |
| <a name="input_explicit_auth_flows"></a> [explicit\_auth\_flows](#input\_explicit\_auth\_flows) | List of authentication flows. | `list(string)` | `[]` | no |
| <a name="input_generate_secret"></a> [generate\_secret](#input\_generate\_secret) | Should an application secret be generated. | `bool` | `false` | no |
| <a name="input_id_token_validity"></a> [id\_token\_validity](#input\_id\_token\_validity) | Time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used. | `number` | `null` | no |
| <a name="input_logout_urls"></a> [logout\_urls](#input\_logout\_urls) | List of allowed logout URLs for the identity providers. | `list(string)` | `[]` | no |
| <a name="input_mfa_configuration"></a> [mfa\_configuration](#input\_mfa\_configuration) | MFA configuration for the User Pool. | `string` | `"OFF"` | no |
| <a name="input_minimum_length"></a> [minimum\_length](#input\_minimum\_length) | Minimum length to require for user passwords. | `number` | `16` | no |
| <a name="input_read_attributes"></a> [read\_attributes](#input\_read\_attributes) | List of user pool attributes the application client can read from. | `list(string)` | `[]` | no |
| <a name="input_refresh_token_validity"></a> [refresh\_token\_validity](#input\_refresh\_token\_validity) | Time limit, between 60 minutes and 10 years, after which the refresh token is no longer valid and cannot be used. | `number` | `null` | no |
| <a name="input_require_lowercase"></a> [require\_lowercase](#input\_require\_lowercase) | Whether to require lowercase characters for user passwords. | `bool` | `true` | no |
| <a name="input_require_numbers"></a> [require\_numbers](#input\_require\_numbers) | Whether to require numbers for user passwords. | `bool` | `true` | no |
| <a name="input_require_symbols"></a> [require\_symbols](#input\_require\_symbols) | Whether to require symbols for user passwords. | `bool` | `true` | no |
| <a name="input_require_uppercase"></a> [require\_uppercase](#input\_require\_uppercase) | Whether to require uppercase characters for user passwords. | `bool` | `true` | no |
| <a name="input_supported_identity_providers"></a> [supported\_identity\_providers](#input\_supported\_identity\_providers) | List of provider names for the identity providers that are supported on this client. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_temporary_password_validity_days"></a> [temporary\_password\_validity\_days](#input\_temporary\_password\_validity\_days) | Number of days a temporary password is valid. | `number` | `1` | no |
| <a name="input_user_pool_client_name"></a> [user\_pool\_client\_name](#input\_user\_pool\_client\_name) | Name of the User Pool Client. | `string` | n/a | yes |
| <a name="input_user_pool_name"></a> [user\_pool\_name](#input\_user\_pool\_name) | Name of the User Pool. | `string` | n/a | yes |
| <a name="input_write_attributes"></a> [write\_attributes](#input\_write\_attributes) | List of user pool attributes the application client can write to. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cognito_user_pool"></a> [cognito\_user\_pool](#output\_cognito\_user\_pool) | Amazon Cognito User Pool resource. |
| <a name="output_cognito_user_pool_client"></a> [cognito\_user\_pool\_client](#output\_cognito\_user\_pool\_client) | Amazon Cognito User Pool Client resource. |
| <a name="output_cognito_user_pool_domain"></a> [cognito\_user\_pool\_domain](#output\_cognito\_user\_pool\_domain) | Amazon Cognito User Pool Domain resource. |
