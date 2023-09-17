
resource "google_cloudbuild_trigger" "infra-trigger" {
  for_each = var.cloudbuild_triggers
  location = var.default_region
  project = var.project_id
  name    =  each.value.trigger_name
  #ignored_files      = ["gke_terraform/application/**"]

  repository_event_config {
    repository = google_cloudbuildv2_repository.infra_repository.id
    push {
      branch = each.value.branch_name
    }
  }

  filename = each.value.filename
}


# resource "google_cloudbuild_trigger" "application-trigger" {
#   location = "us-central1"
#   project = "presales-team-mahesh-15jul"
#   name    =  "dev-application-branch"
#   included_files      = ["application/**"]
  

#   repository_event_config {
#     repository = google_cloudbuildv2_repository.my_repository.id
#     push {
#       branch = "dev-application"
#     }
#   }

#   filename = "cloudbuild-app.yaml"
# }