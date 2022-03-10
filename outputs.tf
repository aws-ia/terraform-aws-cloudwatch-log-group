output "iam_role" {
  description = "IAM role for cloudwatch log group."
  value       = aws_iam_role.main
}

output "log_group" {
  description = "Log group resource output."
  value       = aws_cloudwatch_log_group.main
}

output "sid_service_id" {
  description = "The service being targetted"
  value       = local.sid_service_id
}