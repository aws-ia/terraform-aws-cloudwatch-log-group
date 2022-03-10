<!-- BEGIN_TF_DOCS -->
# AWS Cloudwatch Module

This module creates an AWS Cloudwatch log group along with the corresponding IAM permissions.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_service_principal"></a> [aws\_service\_principal](#input\_aws\_service\_principal) | The name of the service being logged. 'Service Principal' is a special AWS identity that represents a service or other component with an easily understood name. You can find a list of AWS Service Principals at https://gist.github.com/shortjared/4c1e3fe52bdfa47522cfe5b41e5d6f22 | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Encryption for KMS key. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of logs and supporting resources. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0. If you select 0, the events in the log group are always retained and never expire. | `number` | `0` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to be added to sub resources | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM role for cloudwatch log group. |
| <a name="output_log_group"></a> [log\_group](#output\_log\_group) | Log group resource output. |
| <a name="output_sid_service_id"></a> [sid\_service\_id](#output\_sid\_service\_id) | The service being targetted |
<!-- END_TF_DOCS -->