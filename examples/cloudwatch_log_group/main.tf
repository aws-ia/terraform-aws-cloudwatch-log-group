module "basic_enable_cloudwatch_logs_example" {
  source                = "../.."
  name                  = var.name
  retention_in_days     = var.retention_in_days
  kms_key_id            = null
  aws_service_principal = var.aws_service_principal
}

