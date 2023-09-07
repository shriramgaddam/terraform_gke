provider "google" {
  project                     = var.project_name
  request_timeout             = var.provider_request_timeout
  region                      = var.default_region 
}

provider "google-beta" {
  project                     = var.project_name
  request_timeout             = var.provider_request_timeout
  region                      = var.default_region
}