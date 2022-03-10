variable "name" {
  description = "Name of logs and supporting resources."
  type        = string
  validation {
    error_message = "Can include numbers, lowercase letters, uppercase letters, and hyphens (-). It cannot start or end with a hyphen (-)."
    condition     = can(regex("^[0-9a-zA-Z]+([0-9a-zA-Z-]*[0-9a-zA-Z])*$", var.name))
  }
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = 0
}

variable "tags" {
  description = "tags to be added to sub resources"
  type        = map(string)
  default     = null
}

variable "kms_key_id" {
  description = "Encryption for KMS key."
  type        = string
}

variable "aws_service_principal" {
  description = "The name of the service being logged. 'Service Principal' is a special AWS identity that represents a service or other component with an easily understood name. You can find a list of AWS Service Principals at https://gist.github.com/shortjared/4c1e3fe52bdfa47522cfe5b41e5d6f22"
  type        = string
  validation {
    error_message = "The aws service to be logged cannot end or begin with a hyphen and must contain the suffix 'amazonaws.com'."
    condition     = can(regex("^[0-9a-z]+([0-9a-z-.]*[0-9a-z])*.amazonaws.com$", var.aws_service_principal))
  }
}