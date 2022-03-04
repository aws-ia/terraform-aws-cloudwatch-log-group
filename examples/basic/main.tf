module "basic_cloudwatch_logs_example" {
  source = "../.."
  name              = var.name
  retention_in_days = "30"

}