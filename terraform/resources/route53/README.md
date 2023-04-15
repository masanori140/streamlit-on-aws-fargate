# Amazon Route53 Record Terraform Resource

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.3.0 |

## Providers

| Name | Version   |
|------|-----------|
| aws  | ~> 4.57.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | Dynamic block for create alias records. | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the record. | `string` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | A string list of records. | `list(string)` | `[]` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | TTL of the record. | `number` | `300` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of the record. | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | ID of the hosted zone to contain this record. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route53_record"></a> [route53\_record](#output\_route53\_record) | Amazon Route53 record resource. |
