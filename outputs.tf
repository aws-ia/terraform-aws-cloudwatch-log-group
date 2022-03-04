output "iam_role" {
  description = "IAM role for cloudwatch log group."
  value       = aws_iam_role.flow_log_cloudwatch
}

output "log_group" {
  description = "Log group resource output."
  value       = aws_cloudwatch_log_group.flow_log
}