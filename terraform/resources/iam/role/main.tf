# AWS IAM Role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

resource "aws_iam_role" "this" {
  description        = var.description
  name               = var.name
  assume_role_policy = templatefile(var.path, var.vars)
  tags               = merge(var.tags, { "Name" = var.name })
}

# AWS IAM Role Policy Attachment
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment

resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.policies)
  role       = aws_iam_role.this.name
  policy_arn = var.policies[count.index]
  depends_on = [aws_iam_role.this]
}
