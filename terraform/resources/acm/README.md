# AWS Certificate Manager(ACM) Terraform Resource

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
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_overwrite"></a> [allow\_overwrite](#input\_allow\_overwrite) | Allow Terraform to overwrite an existing record when creating. | `bool` | `true` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for which you want to request a certificate. | `string` | n/a | yes |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | A list of domains that should be SANs in the issued certificate. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | The TTL of the record. | `number` | `300` | no |
| <a name="input_validation_method"></a> [validation\_method](#input\_validation\_method) | The method to validate certificate. | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The ID of the hosted zone to contain this record. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate"></a> [acm\_certificate](#output\_acm\_certificate) | n/a |
| <a name="output_acm_certificate_validation"></a> [acm\_certificate\_validation](#output\_acm\_certificate\_validation) | n/a |

## Usage

```hcl

# Amazon Route 53 Public Hosted Zone Data Source

data "aws_route53_zone" "this" {
  name         = "example.com"
  private_zone = false
}

# Create ACM certificate

module "acm" {
  source            = "git::https://github.com/maishio/terraform-aws-resources.git//acm"
  domain_name       = "api.${data.aws_route53_zone.this.name}"
  validation_method = "DNS"
  zone_id           = data.aws_route53_zone.this.zone_id
}
```
