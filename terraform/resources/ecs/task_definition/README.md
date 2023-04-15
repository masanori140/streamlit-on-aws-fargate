# Amazon ECS Task Definition Terraform Resource

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
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The number of cpu units used by the task. | `string` | `"256"` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume. | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | A unique name for your task definition. | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Amount (in MiB) of memory used by the task. | `string` | `"512"` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | Docker networking mode to use for the containers in the task. | `string` | `"awsvpc"` | no |
| <a name="input_path"></a> [path](#input\_path) | Path to the task definition template. | `string` | `null` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | Set of launch types required by the task. Valid values are `EC2` and `FARGATE`. | `list(string)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services. | `string` | `null` | no |
| <a name="input_vars"></a> [vars](#input\_vars) | Variables to pass to the task definition template. | `map(string)` | `{}` | no |
| <a name="input_volume"></a> [volume](#input\_volume) | Dynamic block for the volume. | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_task_definition"></a> [ecs\_task\_definition](#output\_ecs\_task\_definition) | n/a |
