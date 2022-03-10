<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72.0 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | >= 0.9.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_basic_enable_cloudwatch_logs_example"></a> [basic\_enable\_cloudwatch\_logs\_example](#module\_basic\_enable\_cloudwatch\_logs\_example) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_service_principal"></a> [aws\_service\_principal](#input\_aws\_service\_principal) | n/a | `string` | `"dynamodb.application-autoscaling.amazonaws.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"app123"` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | n/a | `string` | `"14"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM role for cloudwatch log group. |
| <a name="output_log_group"></a> [log\_group](#output\_log\_group) | Log group resource output. |
<!-- END_TF_DOCS -->