variable "project_id" {
  description = "Project ID"
  type        = string
}


variable "default_region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "us-central1"
}

variable "provider_request_timeout" {
  description = "Request timeout for the google provider"
  type        = string
  default     = "60s"
}
variable "disabled" {
  description = "Whether the trigger is disabled or not"
  type        = bool
  default     = false
}

# variable "service_account" {
#   description = "The service account used for all user-controlled operations"
#   type        = string
#   default     = null
# }



# variable "cloudbuild_triggers" {
#   type = map(object({
#     trigger_name        = string
#     repo_name           = string
#     tag_name            = string
#     trigger_description = string
#     cloudbuild_filename = string
#     substitutions       = map(string)
#     included_files      = list(string)
#     approval_required   = bool
#   }))
#   description = "List of cloud build triggers to manage in centralised cloud build resources."
# }
