# Amazon S3 Bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "this" {
  bucket        = var.bucket
  force_destroy = var.force_destroy
  tags          = merge(var.tags, { "Name" = var.bucket })
}

# Amazon S3 Bucket Accelerate Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_accelerate_configuration

resource "aws_s3_bucket_accelerate_configuration" "this" {
  bucket                = aws_s3_bucket.this.id
  expected_bucket_owner = var.expected_bucket_owner
  status                = var.accelerate_status
}

# Amazon S3 Bucket ACL
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}

# Amazon S3 Bucket CORS Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration

resource "aws_s3_bucket_cors_configuration" "this" {
  count  = var.create_s3_bucket_cors_configuration ? 1 : 0
  bucket = aws_s3_bucket.this.id

  ### Dynamic block for create the cors_rule ###

  dynamic "cors_rule" {
    for_each = var.cors_rule
    content {
      allowed_headers = lookup(cors_rule.value, "allowed_headers", [])
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = lookup(cors_rule.value, "expose_headers", [])
      max_age_seconds = lookup(cors_rule.value, "max_age_seconds", 0)
    }
  }
}

# Amazon S3 Bucket Lifecycle Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count  = var.create_s3_bucket_lifecycle_configuration ? 1 : 0
  bucket = aws_s3_bucket.this.id

  ### Dynamic block for create the lifecycle rules ###

  dynamic "rule" {
    for_each = var.rule
    content {
      id     = rule.value.id
      status = rule.value.status

      dynamic "expiration" {
        for_each = lookup(rule.value, "expiration", [])
        content {
          date                         = lookup(expiration.value, "date", null)
          days                         = lookup(expiration.value, "days", null)
          expired_object_delete_marker = lookup(expiration.value, "expired_object_delete_marker", null)
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lookup(rule.value, "noncurrent_version_expiration", [])
        content {
          noncurrent_days           = lookup(noncurrent_version_expiration.value, "noncurrent_days", null)
          newer_noncurrent_versions = lookup(noncurrent_version_expiration.value, "newer_noncurrent_versions", null)
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lookup(rule.value, "noncurrent_version_transition", [])
        content {
          newer_noncurrent_versions = lookup(noncurrent_version_transition.value, "newer_noncurrent_versions", null)
          noncurrent_days           = lookup(noncurrent_version_transition.value, "noncurrent_days", null)
          storage_class             = noncurrent_version_transition.value.storage_class
        }
      }

      dynamic "transition" {
        for_each = lookup(rule.value, "transition", [])
        content {
          date          = lookup(transition.value, "date", null)
          days          = lookup(transition.value, "days", null)
          storage_class = transition.value.storage_class
        }
      }

      dynamic "filter" {
        for_each = lookup(rule.value, "filter", [])
        content {
          prefix = filter.value.prefix
        }
      }
    }
  }
}

# Amazon S3 Bucket Logging
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging

resource "aws_s3_bucket_logging" "this" {
  count         = var.create_s3_bucket_logging ? 1 : 0
  bucket        = aws_s3_bucket.this.id
  target_bucket = var.target_bucket
  target_prefix = var.target_prefix
}

# Amazon S3 Bucket Notification
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification

resource "aws_s3_bucket_notification" "this" {
  count  = var.create_s3_bucket_notification ? 1 : 0
  bucket = aws_s3_bucket.this.id

  dynamic "lambda_function" {
    for_each = var.lambda_function
    content {
      lambda_function_arn = lambda_function.value.lambda_function_arn
      events              = lambda_function.value.events
      filter_prefix       = lookup(lambda_function.value, "filter_prefix", null)
      filter_suffix       = lookup(lambda_function.value, "filter_suffix", null)
    }
  }
}

# Amazon S3 Bucket Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy

resource "aws_s3_bucket_policy" "this" {
  count  = var.create_s3_bucket_policy ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = templatefile(var.path, var.vars)

  depends_on = [
    aws_s3_bucket.this,
    aws_s3_bucket_public_access_block.this
  ]
}

# Amazon S3 Bucket Public Access Block
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
  depends_on              = [aws_s3_bucket.this]
}

# Amazon S3 Bucket Request Payment Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_request_payment_configuration

resource "aws_s3_bucket_request_payment_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  payer  = var.request_payer
}

# Amazon S3 Bucket Server Side Encryption Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    bucket_key_enabled = var.bucket_key_enabled

    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

# Amazon S3 Bucket Versioning
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning_status
  }
}
