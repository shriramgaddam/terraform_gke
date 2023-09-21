variable "project_name" {
  description = "Project name"
  type        = string
}

variable "default_service_account" {
  description = "Whether to keep, disable or delete default project service account"
  type        = string
  default     = "disable"
}

