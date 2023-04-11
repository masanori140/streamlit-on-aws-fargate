# Amazon VPC Security Group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

variable "description" {
  type    = string
  default = "Managed by Terraform"
}

variable "security_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc_id" {
  type = string
}

# Amazon VPC Security Group Ingress Rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule

variable "ingress_rule" {
  type = any
}

# Amazon VPC Security Group Engress Rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule

variable "egress_rule" {
  type = any
  default = {
    0 = {
      description              = null
      from_port                = 0,
      to_port                  = 0,
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0"]
      source_security_group_id = null
    }
  }
}


