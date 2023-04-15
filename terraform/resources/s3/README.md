# Amazon S3 Terraform Resource

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
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_accelerate_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_accelerate_configuration) | resource |
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_notification.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_request_payment_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_request_payment_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accelerate_status"></a> [accelerate\_status](#input\_accelerate\_status) | Transfer acceleration state of the bucket. Valid values are `Enabled` and `Suspended`. | `string` | `"Suspended"` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | Canned ACL to apply to the bucket. | `string` | `"private"` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Name of the bucket. | `string` | n/a | yes |
| <a name="input_bucket_key_enabled"></a> [bucket\_key\_enabled](#input\_bucket\_key\_enabled) | Whether or not to use Amazon S3 Bucket Keys for SSE-KMS. | `bool` | `false` | no |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | Dynamic block for create the cors\_rule. | `list(any)` | `[]` | no |
| <a name="input_create_s3_bucket_cors_configuration"></a> [create\_s3\_bucket\_cors\_configuration](#input\_create\_s3\_bucket\_cors\_configuration) | Whether to create a CORS configuration for the bucket. | `bool` | `false` | no |
| <a name="input_create_s3_bucket_lifecycle_configuration"></a> [create\_s3\_bucket\_lifecycle\_configuration](#input\_create\_s3\_bucket\_lifecycle\_configuration) | Whether to create a lifecycle configuration for the bucket. | `bool` | `false` | no |
| <a name="input_create_s3_bucket_logging"></a> [create\_s3\_bucket\_logging](#input\_create\_s3\_bucket\_logging) | Whether to create a logging configuration for the bucket. | `bool` | `false` | no |
| <a name="input_create_s3_bucket_notification"></a> [create\_s3\_bucket\_notification](#input\_create\_s3\_bucket\_notification) | Whether to create a notification configuration for the bucket. | `bool` | `false` | no |
| <a name="input_create_s3_bucket_policy"></a> [create\_s3\_bucket\_policy](#input\_create\_s3\_bucket\_policy) | Whether to create a policy for the bucket. | `bool` | `false` | no |
| <a name="input_expected_bucket_owner"></a> [expected\_bucket\_owner](#input\_expected\_bucket\_owner) | Account ID of the expected bucket owner. | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. | `bool` | `false` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_lambda_function"></a> [lambda\_function](#input\_lambda\_function) | Dynamic block for create the lambda\_function. | `list(any)` | `[]` | no |
| <a name="input_path"></a> [path](#input\_path) | Path to the policy document. | `string` | `null` | no |
| <a name="input_request_payer"></a> [request\_payer](#input\_request\_payer) | Specifies who pays for the download and request fees. Valid values are `BucketOwner` and `Requester`. | `string` | `"BucketOwner"` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_rule"></a> [rule](#input\_rule) | Dynamic block for create the lifecycle rules. | `list(any)` | `[]` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | Server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`. | `string` | `"AES256"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_target_bucket"></a> [target\_bucket](#input\_target\_bucket) | Name of the bucket where you want Amazon S3 to store server access logs. | `string` | `null` | no |
| <a name="input_target_prefix"></a> [target\_prefix](#input\_target\_prefix) | Prefix for all log object keys. | `string` | `null` | no |
| <a name="input_vars"></a> [vars](#input\_vars) | Variables to pass to the policy document. | `map(string)` | `{}` | no |
| <a name="input_versioning_status"></a> [versioning\_status](#input\_versioning\_status) | Versioning state of the bucket. Valid values are `Enabled`, `Suspended`, or `Disabled`. | `string` | `"Disabled"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket"></a> [s3\_bucket](#output\_s3\_bucket) | Amazon S3 Bucket resource. |
