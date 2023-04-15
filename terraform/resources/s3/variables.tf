# Amazon S3 Bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

variable "bucket" {
  description = "Name of the bucket."
  type        = string
}

variable "force_destroy" {
  description = "Boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

# Amazon S3 Bucket Accelerate Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_accelerate_configuration

variable "accelerate_status" {
  description = "Transfer acceleration state of the bucket. Valid values are `Enabled` and `Suspended`."
  type        = string
  default     = "Suspended"
}

variable "expected_bucket_owner" {
  description = "Account ID of the expected bucket owner."
  type        = string
  default     = null
}

# Amazon S3 Bucket ACL
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl

variable "acl" {
  description = "Canned ACL to apply to the bucket."
  type        = string
  default     = "private"
}

# Amazon S3 Bucket CORS Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration

variable "create_s3_bucket_cors_configuration" {
  description = "Whether to create a CORS configuration for the bucket."
  type        = bool
  default     = false
}

variable "cors_rule" {
  description = "Dynamic block for create the cors_rule."
  type        = list(any)
  default     = []
}

# Amazon S3 Bucket Lifecycle Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration

variable "create_s3_bucket_lifecycle_configuration" {
  description = "Whether to create a lifecycle configuration for the bucket."
  type        = bool
  default     = false
}

variable "rule" {
  description = "Dynamic block for create the lifecycle rules."
  type        = list(any)
  default     = []
}

# Amazon S3 Bucket Logging
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging

variable "create_s3_bucket_logging" {
  description = "Whether to create a logging configuration for the bucket."
  type        = bool
  default     = false
}

variable "target_bucket" {
  description = "Name of the bucket where you want Amazon S3 to store server access logs."
  type        = string
  default     = null
}

variable "target_prefix" {
  description = "Prefix for all log object keys."
  type        = string
  default     = null
}

# Amazon S3 Bucket Notification
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification

variable "create_s3_bucket_notification" {
  description = "Whether to create a notification configuration for the bucket."
  type        = bool
  default     = false
}

variable "lambda_function" {
  description = "Dynamic block for create the lambda_function."
  type        = list(any)
  default     = []
}

# Amazon S3 Bucket Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy

variable "create_s3_bucket_policy" {
  description = "Whether to create a policy for the bucket."
  type        = bool
  default     = false
}

variable "path" {
  description = "Path to the policy document."
  type        = string
  default     = null
}

variable "vars" {
  description = "Variables to pass to the policy document."
  type        = map(string)
  default     = {}
}

# Amazon S3 Bucket Public Access Block
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = true
}

# Amazon S3 Bucket Request Payment Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_request_payment_configuration

variable "request_payer" {
  description = "Specifies who pays for the download and request fees. Valid values are `BucketOwner` and `Requester`."
  type        = string
  default     = "BucketOwner"
}

# Amazon S3 Bucket Server Side Encryption Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration

variable "bucket_key_enabled" {
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
  type        = bool
  default     = false
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`."
  type        = string
  default     = "AES256"
}

# Amazon S3 Bucket Versioning
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning

variable "versioning_status" {
  description = "Versioning state of the bucket. Valid values are `Enabled`, `Suspended`, or `Disabled`."
  type        = string
  default     = "Disabled"
}
