# --------------------------------------------------------------------------------
# Application Load Balancer アクセスログ保管 S3 Bucket モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# --------------------------------------------------------------------------------

module "s3" {
  source        = "git::https://github.com/norishio2022/terraform-aws-resources.git//s3"
  bucket        = "${var.tags.service}-${var.tags.env}-alb-logs"
  force_destroy = true
  tags          = var.tags

  # --------------------------------------------------------------------------------
  # バケットポリシー
  # --------------------------------------------------------------------------------

  create_s3_bucket_policy = true
  path                    = "${path.module}/files/template/alb_s3_bucket_policy.json.tpl"
  vars = {
    ACCOUNT = data.aws_elb_service_account.this.arn
    BUCKET  = "${var.tags.service}-${var.tags.env}-alb-logs"
  }
}
