locals {
  # sid cannot have a dash(-) if one is present we will remove and title case the string
  sid_name = title(join("",[for _, value in split("-", var.name): title(value)]))
}
resource "aws_cloudwatch_log_group" "flow_log" {
  name_prefix       = var.name
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id
  tags              = var.tags
}

# cannot use awscc_iam_role
# https://github.com/hashicorp/terraform-provider-awscc/issues/402

resource "aws_iam_role" "flow_log_cloudwatch" {
  name_prefix = "${var.name}-vpc-flow-log-"
  description = "VPC Flow logs for ${var.name}"

  tags = var.tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "${local.sid_name}VPCFlowLogs",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "flow_log_cloudwatch" {
  name_prefix = "${var.name}-vpc-flow-log-"
  policy      = data.aws_iam_policy_document.flow_log_cloudwatch.json
}

data "aws_iam_policy_document" "flow_log_cloudwatch" {
  statement {
    sid = "${local.sid_name}VPCFlowLogsToCW"

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

resource "aws_iam_role_policy_attachment" "flow_log_cloudwatch" {
  role       = aws_iam_role.flow_log_cloudwatch.name
  policy_arn = aws_iam_policy.flow_log_cloudwatch.arn
}