# Amazon VPC Security Group Terraform Resource

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.4.0 |

## Providers

| Name | Version   |
|------|-----------|
| aws  | ~> 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"Managed by Terraform"` | no |
| <a name="input_egress_rule"></a> [egress\_rule](#input\_egress\_rule) | n/a | `any` | <pre>{<br>  "0": {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "description": null,<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "source_security_group_id": null,<br>    "to_port": 0<br>  }<br>}</pre> | no |
| <a name="input_ingress_rule"></a> [ingress\_rule](#input\_ingress\_rule) | n/a | `any` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | n/a |

## Usage

```hcl
module "security_group" {
  source              = "git::https://github.com/maishio/terraform-aws-resources.git//security_group"
  security_group_name = "${var.tags.service}-${var.tags.env}-alb-sg"
  tags                = var.tags
  vpc_id              = var.vpc_id
  ingress_rule = {
    0 = {
      cidr_blocks = ["13.xxx.xxx.xxx/32"]
      description = "Branch Office A"
      from_port   = 443
      protocol    = "tcp"
      to_port     = 443
    },
    1 = {
      cidr_blocks = ["13.xxx.xxx.xxx/32"]
      description = "Branch Office B"
      from_port   = 443
      protocol    = "tcp"
      to_port     = 443
    }
  }
}
```
