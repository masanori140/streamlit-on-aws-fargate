# Amazon ECS Service Terraform Resource

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
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_task_definition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Assign a public IP address to the ENI (Fargate launch type only). | `bool` | `false` | no |
| <a name="input_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#input\_capacity\_provider\_strategy) | Dynamic block for the capacity provider strategy. | `list(map(string))` | `[]` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | ARN of the cluster in which to run the service. | `string` | n/a | yes |
| <a name="input_deployment_controller_type"></a> [deployment\_controller\_type](#input\_deployment\_controller\_type) | Type of deployment controller. Defaults to `ECS`. | `string` | `"ECS"` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The number of instances of the task definition to place and keep running. | `number` | `0` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. | `number` | `0` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | Launch type on which to run your service. The valid values are `EC2`, `FARGATE`, and `EXTERNAL`. Defaults to `EC2`. | `string` | `"EC2"` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | Dynamic block for the load balancer. | `list(map(string))` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the service. | `string` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security group IDs to assign to the ENI. | `list(string)` | `[]` | no |
| <a name="input_service_registries"></a> [service\_registries](#input\_service\_registries) | Dynamic block for the service registries. | `list(map(string))` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets associated with the task or service. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_task_family"></a> [task\_family](#input\_task\_family) | Name of the task definition. | `string` | n/a | yes |
| <a name="input_task_revision"></a> [task\_revision](#input\_task\_revision) | Revision of the task definition. | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_service"></a> [ecs\_service](#output\_ecs\_service) | Amazon ECS Service resource. |
