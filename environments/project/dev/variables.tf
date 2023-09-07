####################### Variables for creating service-project ##################

variable "project_id" {
  description = "Project name"
  type        = string
}

variable "default_region" {
  type        = string
  description = "Default region to deploy resources"
  default     = "us-central1"
}

variable "provider_request_timeout" {
  description = "Request timeout for the google provider"
  type        = string
  default     = "60s"
}
