# AWS IAM Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy

resource "aws_iam_policy" "this" {
  description = var.description
  name        = var.name
  policy      = templatefile(var.path, var.vars)
  tags        = merge(var.tags, { "Name" = var.name })
}

# AWS IAM Role Policy Attachment
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment

resource "aws_iam_role_policy_attachment" "this" {
  count      = var.create_iam_role_policy_attachment ? 1 : 0
  role       = var.role
  policy_arn = aws_iam_policy.this.arn
  depends_on = [aws_iam_policy.this]
}
