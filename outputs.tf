output "iam_role" {
  description = "IAM role for cloudwatch log group."
  value       = aws_iam_role.iam_role
}

output "log_group" {
  description = "Log group resource output."
  value       = aws_cloudwatch_log_group.log_group
}

output "service_name" {
  description = "The service being targetted"
  value       = local.service_name
}

output "sid_service_id" {
  description = "The service being targetted"
  value       = local.sid_service_id
}