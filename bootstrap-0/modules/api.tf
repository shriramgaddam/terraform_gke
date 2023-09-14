
# basic APIs needed to get project and cloudbuild running
resource "google_project_service" "apis" {
  for_each                   = toset(var.enable_cloudbuild_apis)
  project                    = "${var.project_id}"
  service                    = each.value
  disable_dependent_services = true
}