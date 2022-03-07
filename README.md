<!-- BEGIN_TF_DOCS -->
# Creating modules for AWS I&A Organization

### TL;DR

1. [install pre-commit](https://pre-commit.com/)
2. configure pre-commit: `pre-commit install`
3. install required tools
    - [tflint](https://github.com/terraform-linters/tflint)
    - [tfsec](https://aquasecurity.github.io/tfsec/v1.0.11/)
    - [terraform-docs](https://github.com/terraform-docs/terraform-docs)
    - [golang](https://go.dev/doc/install) (for macos you can use `brew`)

Write code according to [I&A module standards](https://github.com/aws-ia/standards-terraform/blob/main/content/_index.en.md)

## Module Documentation

**Do not manually update README.md**. `terraform-docs` is used to generate README files. For any instructions an content, please update [.header.md](./.header.md) then simply run `terraform-docs ./` or allow the `pre-commit` to do so.

## Terratest

Please include tests to validate your examples/<> root modules, at a minimum. This can be accomplished with usually only slight modifications to the [boilerplate test provided in this template](./test/examples\_basic\_test.go)

### Configure and run Terratest

1. Install

    [golang](https://go.dev/doc/install) (for macos you can use `brew`)
2. Change directory into the test folder.
    
    `cd test`
3. Initialize your test
    
    go mod init github.com/[github org]/[repository]

    `go mod init github.com/aws-ia/terraform-aws-cloudwatch`
4. Run tidy

    `git mod tidy`
5. Install Terratest

    `go get github.com/gruntwork-io/terratest/modules/terraform`
6. Run the test.

    `go test`

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of flow logs and supporting resources. | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Encryption for KMS key. | `string` | `null` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0. If you select 0, the events in the log group are always retained and never expire. | `number` | `0` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to be added to sub resources | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM role for cloudwatch log group. |
| <a name="output_log_group"></a> [log\_group](#output\_log\_group) | Log group resource output. |
<!-- END_TF_DOCS -->