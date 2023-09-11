# ########### Repo Connection#########
# resource "google_cloudbuildv2_repository" "my_repository" {
#     project = "presales-team-mahesh-15jul"
#     location = "us-central1"
#     name = "terraform_gke"
#     parent_connection = google_cloudbuildv2_connection.my_connection.name
#     remote_uri = "https://github.com/shriramgaddam/terraform_gke.git"
#   }



########### build trigger #########
resource "google_cloudbuild_trigger" "repo-trigger" {
  location = "us-central1"
  project = "presales-team-mahesh-15jul"
  name    =  "dev-application-branch"
  included_files      = ["gke_terraform/application/**"]
  

  repository_event_config {
    repository = google_cloudbuildv2_repository.my_repository.id
    push {
      branch = "dev-app*"
    }
  }

  filename = "cloudbuild-app.yaml"
}

