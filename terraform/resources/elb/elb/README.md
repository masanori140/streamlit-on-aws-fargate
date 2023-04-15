# ELB (Elastic Load Balancing) Terraform Resource

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
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs"></a> [access\_logs](#input\_access\_logs) | A list of access\_logs objects for the dynamic block. | `list(map(string))` | `[]` | no |
| <a name="input_drop_invalid_header_fields"></a> [drop\_invalid\_header\_fields](#input\_drop\_invalid\_header\_fields) | Indicates whether HTTP headers with invalid header fields are removed by the load balancer (true) or routed to targets (false). Defaults to `false`. | `bool` | `false` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable\_cross\_zone\_load\_balancing](#input\_enable\_cross\_zone\_load\_balancing) | Indicates whether cross-zone load balancing is enabled. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Indicates whether deletion protection is enabled. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_enable_http2"></a> [enable\_http2](#input\_enable\_http2) | Indicates whether HTTP/2 is enabled. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | The time in seconds that the connection is allowed to be idle. Defaults to `60`. | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | If true, the LB will be internal. | `bool` | `false` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | Type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4`and `dualstack`. | `string` | `"ipv4"` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Type of load balancer. Defaults to `application`. | `string` | `"application"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the load balancer. | `string` | `null` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | A list of security group IDs to assign to the LB. | `list(string)` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnet IDs to attach to the LB. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elb"></a> [elb](#output\_elb) | n/a |
