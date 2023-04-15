# Amazon S3 Bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

output "s3_bucket" {
  description = "Amazon S3 Bucket resource."
  value       = aws_s3_bucket.this
}
