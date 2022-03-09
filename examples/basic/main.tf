module "basic_enable_cloudwatch_logs_example" {
  source            = "../.."
  name              = var.name
  retention_in_days = "30"
  aws_service       = "dynamodb.application-autoscaling.amazonaws.com"
}