module "s3" {
  source        = "../../resources/s3"
  bucket        = "${var.tags.service}-${var.tags.env}-alb-logs-${var.account.id}"
  force_destroy = true
  tags          = var.tags

  # Create S3 Bucket Policy
  create_s3_bucket_policy = true
  path                    = "${path.module}/files/template/alb_s3_bucket_policy.json.tpl"
  vars = {
    ACCOUNT = data.aws_elb_service_account.this.arn
    BUCKET  = "${var.tags.service}-${var.tags.env}-alb-logs-${var.account.id}"
  }
}
