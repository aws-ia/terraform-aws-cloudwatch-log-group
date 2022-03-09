locals {
  # sid cannot have a dash(-) if one is present we will remove and title case the string
  sid_name     = title(join("", [for _, value in split("-", var.name) : title(value)]))
  service_name = var.aws_service
  service_id   = trimsuffix(var.aws_service, ".amazonaws.com")
  sid_service_id = title(
    join("", [for _, value in split(".",
      join("", [for _, value in split("-", local.service_id) : title(value)])) : title(value)]
    )
  )
}

resource "aws_cloudwatch_log_group" "log_group" {
  name_prefix       = var.name
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id
  tags              = var.tags
}

# cannot use awscc_iam_role
# https://github.com/hashicorp/terraform-provider-awscc/issues/402

resource "aws_iam_role" "iam_role" {
  name_prefix = "${var.name}-cloudwatch-log-"
  description = "Cloudwatch permissions for ${var.name} ${local.service_id}"

  tags = var.tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "${local.sid_name}${local.sid_service_id}CloudwatchLogs",
      "Effect": "Allow",
      "Principal": {
        "Service": "${local.service_name}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "iam_policy" {
  name_prefix = "${var.name}-${local.service_id}-cloudwatch-log-"
  policy      = data.aws_iam_policy_document.policy_document.json
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    sid = "${local.sid_name}LogsToCW"

    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
    ]
    #tfsec:ignore:aws-iam-no-policy-wildcards
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "iam_policy" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}