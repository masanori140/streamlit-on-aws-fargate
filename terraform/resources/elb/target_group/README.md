# ELB (Elastic Load Balancing) Target Group Terraform Resource

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
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deregistration_delay"></a> [deregistration\_delay](#input\_deregistration\_delay) | The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. | `number` | `300` | no |
| <a name="input_health_check_enabled"></a> [health\_check\_enabled](#input\_health\_check\_enabled) | Whether health checks are enabled. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_health_check_healthy_threshold"></a> [health\_check\_healthy\_threshold](#input\_health\_check\_healthy\_threshold) | Number of consecutive health check successes required before considering a target healthy. Defaults to `3`. | `number` | `3` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | Time between health checks. Defaults to `30`. | `number` | `30` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | Response codes to use when checking for a healthy responses from a target. | `string` | `null` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Destination for the health check request. | `string` | `null` | no |
| <a name="input_health_check_port"></a> [health\_check\_port](#input\_health\_check\_port) | Port the load balancer uses when performing health checks on targets. | `string` | `"traffic-port"` | no |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | Protocol the load balancer uses when performing health checks on targets. Defaults to `HTTP`. | `string` | `"HTTP"` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | Amount of time to wait when receiving a response from the health check, in seconds. Defaults to `5`. | `number` | `5` | no |
| <a name="input_health_check_unhealthy_threshold"></a> [health\_check\_unhealthy\_threshold](#input\_health\_check\_unhealthy\_threshold) | Number of consecutive health check failures required before considering a target unhealthy. Defaults to `3`. | `number` | `3` | no |
| <a name="input_lambda_multi_value_headers_enabled"></a> [lambda\_multi\_value\_headers\_enabled](#input\_lambda\_multi\_value\_headers\_enabled) | Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the target group. | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Port on which targets receive traffic, unless overridden when registering a specific target. | `number` | `null` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol to use for routing traffic to the targets. | `string` | `null` | no |
| <a name="input_proxy_protocol_v2"></a> [proxy\_protocol\_v2](#input\_proxy\_protocol\_v2) | Whether to enable support for proxy protocol v2 on Network Load Balancers. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_slow_start"></a> [slow\_start](#input\_slow\_start) | Amount time for targets to warm up before the load balancer sends them a full share of requests. | `number` | `0` | no |
| <a name="input_stickiness_cookie_duration"></a> [stickiness\_cookie\_duration](#input\_stickiness\_cookie\_duration) | Time period, in seconds, during which requests from a client should be routed to the same target. Defaults to `86400`. | `number` | `86400` | no |
| <a name="input_stickiness_enabled"></a> [stickiness\_enabled](#input\_stickiness\_enabled) | Whether sticky sessions are enabled. | `bool` | `false` | no |
| <a name="input_stickiness_type"></a> [stickiness\_type](#input\_stickiness\_type) | Type of sticky sessions. | `string` | `"lb_cookie"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Type of target that you must specify when registering targets with this target group. | `string` | `"instance"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elb_target_group"></a> [elb\_target\_group](#output\_elb\_target\_group) | n/a |
