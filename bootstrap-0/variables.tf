
variable "project_id" {
  description = "Project id"
  type        = string
}


variable "default_region" {
  type        = string
  description = "Default region to deploy resources"
  default     = "us-central1"
}

variable "provider_request_timeout" {
  description = "Request timeput for the google provider"
  type        = string
  default     = "60s"
}

variable "enable_cloudbuild_apis" {
  description = "APIs to activate"
  type        = list(string)
}


variable "service_accounts" {
  type = map(object({
    description         = string
    display_name_prefix = string
    sa_name_prefix      = string
    project_role        = list(string)
  }))
}


variable "cb_resources_trigger" {
  type = map(object({
    trigger_name        = string
    trigger_type        = string
    repo_name           = string
    trigger_description = string
    cloudbuild_filename = string
    branch_name         = string
    substitutions       = map(string)
    included_files      = list(string)
    approval_required   = bool
  }))
  description = "List of cloud build triggers to manage in centralised cloud build resources."
  default     = {}
}


variable "cloudbuild_triggers" {
  type = map(object({
    trigger_name        = string
    repo_name           = string
    trigger_description = string
    cloudbuild_filename = string
    branch_name         = string
    substitutions       = map(string)
    included_files      = list(string)
    approval_required   = bool
  }))
  description = "List of cloud build triggers to manage in centralised cloud build resources."
  default     = {}
}


variable "infra_repo" {
  description = "infra trigger name"
  type        = string
}

variable "infra_secret_id" {
  description = "infra github repo secret id name"
  type        = string
}

variable "infra_repo_uri" {
  description = "infra github repo uri"
  type        = string
}


variable "github_pat" {
  description = " github pesonal access token "
  type        = string
}


variable "installation_id" {
  description = " github cloud app installation id "
  type        = string
}

variable "group_cloudbuild_admins" {
  description = "Cloud Admin group"
  type        = list(string)
}

variable "cloud_source_repos" {
  description = "List of Cloud Source Repos to create with CloudBuild triggers."
  type        = list(string)

  default = [
    "gke-demo-infra",
    "gke-demo-application",
  ]
}

