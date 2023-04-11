# Amazon VPC Security Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "this" {
  name        = var.security_group_name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = merge(var.tags, { "Name" = var.security_group_name })
}

# Amazon VPC Security Group Ingress Rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule

resource "aws_security_group_rule" "ingress" {
  for_each                 = var.ingress_rule
  security_group_id        = aws_security_group.this.id
  description              = lookup(each.value, "description", null)
  type                     = "ingress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  cidr_blocks              = lookup(each.value, "cidr_blocks", null)
  source_security_group_id = lookup(each.value, "source_security_group_id", null)
}

# Amazon VPC Security Group Engress Rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule

resource "aws_security_group_rule" "egress" {
  for_each                 = var.egress_rule
  security_group_id        = aws_security_group.this.id
  description              = lookup(each.value, "description", null)
  type                     = "egress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  cidr_blocks              = lookup(each.value, "cidr_blocks", null)
  source_security_group_id = lookup(each.value, "source_security_group_id", null)
}
