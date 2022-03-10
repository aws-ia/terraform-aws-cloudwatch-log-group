variable "name" {
  default = "app123"
}
variable "retention_in_days" {
  default = "14"
}
variable "aws_service_principal" {
  default = "dynamodb.application-autoscaling.amazonaws.com"
}