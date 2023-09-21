provider "google" {
  project                     = var.project_id
  request_timeout             = var.provider_request_timeout
  region                      = var.default_region 
  impersonate_service_account = var.tf_impersonate_service_account
}

provider "google-beta" {
  project                     = var.project_id
  request_timeout             = var.provider_request_timeout
  region                      = var.default_region
  impersonate_service_account = var.tf_impersonate_service_account
}