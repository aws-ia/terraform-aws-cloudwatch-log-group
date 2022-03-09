output "iam_role" {
  description = "IAM role for cloudwatch log group."
  value       = module.basic_enable_cloudwatch_logs_example.iam_role
}

output "log_group" {
  description = "Log group resource output."
  value       = module.basic_enable_cloudwatch_logs_example.log_group
}