module "basic_enable_cloudwatch_logs_example" {
  source            = "../.."
  name              = var.name
  retention_in_days = var.retention_in_days
  aws_service       = var.aws_service
}

