# Amazon Cognito User Pool Terraform Resource

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_admin_create_user_only"></a> [allow\_admin\_create\_user\_only](#input\_allow\_admin\_create\_user\_only) | Set to `true` to allow only administrators to create user profiles. Set to `false` to allow non-administrators to create user profiles. | `bool` | `true` | no |
| <a name="input_auto_verified_attributes"></a> [auto\_verified\_attributes](#input\_auto\_verified\_attributes) | Attributes to be auto-verified. Valid values are `email` and `phone_number`. | `list(string)` | `[]` | no |
| <a name="input_default_email_option"></a> [default\_email\_option](#input\_default\_email\_option) | The email option. Must be either `CONFIRM_WITH_LINK` or `CONFIRM_WITH_CODE`. Defaults to `CONFIRM_WITH_CODE`. | `string` | `"CONFIRM_WITH_CODE"` | no |
| <a name="input_email_sending_account"></a> [email\_sending\_account](#input\_email\_sending\_account) | Email delivery method to use. Valid values are `COGNITO_DEFAULT` and `DEVELOPER`. | `string` | `"COGNITO_DEFAULT"` | no |
| <a name="input_mfa_configuration"></a> [mfa\_configuration](#input\_mfa\_configuration) | MFA configuration for the User Pool. | `string` | `"OFF"` | no |
| <a name="input_minimum_length"></a> [minimum\_length](#input\_minimum\_length) | Minimum length to require for user passwords. | `number` | `16` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the User Pool. | `string` | n/a | yes |
| <a name="input_require_lowercase"></a> [require\_lowercase](#input\_require\_lowercase) | Whether to require lowercase characters for user passwords. | `bool` | `true` | no |
| <a name="input_require_numbers"></a> [require\_numbers](#input\_require\_numbers) | Whether to require numbers for user passwords. | `bool` | `true` | no |
| <a name="input_require_symbols"></a> [require\_symbols](#input\_require\_symbols) | Whether to require symbols for user passwords. | `bool` | `true` | no |
| <a name="input_require_uppercase"></a> [require\_uppercase](#input\_require\_uppercase) | Whether to require uppercase characters for user passwords. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_temporary_password_validity_days"></a> [temporary\_password\_validity\_days](#input\_temporary\_password\_validity\_days) | Number of days a temporary password is valid. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cognito_user_pool"></a> [cognito\_user\_pool](#output\_cognito\_user\_pool) | Amazon Cognito User Pool resource. |
