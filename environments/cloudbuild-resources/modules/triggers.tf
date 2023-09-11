
# resource "google_cloudbuild_trigger" "cloud_build_trigger" {
#   for_each = var.cloudbuild_triggers

#   description = each.value.trigger_description
#   name        = each.value.trigger_name
#   project     = module.cloudbuild_project.project_id

#   trigger_template {
#     tag_name  = each.value.tag_name
#     repo_name = each.value.repo_name
#   }

#   included_files = each.value.included_files
#   substitutions  = each.value.substitutions
#   filename       = each.value.cloudbuild_filename


#   depends_on = [
#     module.cloudbuild_project
#     #, google_project_iam_member.cloudbuild_editor
#   ]

# }


# resource "google_cloudbuildv2_repository" "my_repository" {
#     project = "presales-team-mahesh-15jul"
#     location = "us-central1"
#     name = "terraform_gke"
#     parent_connection = google_cloudbuildv2_connection.my_connection.name
#     remote_uri = "https://github.com/shriramgaddam/terraform_gke.git"
#   }


# resource "google_cloudbuild_trigger" "repo-trigger" {
#   location = "us-central1"
#   project = "presales-team-mahesh-15jul"
#   name    =  "dev-application-branch"
#   included_files      = ["gke_terraform/application/**"]
  

#   repository_event_config {
#     repository = google_cloudbuildv2_repository.my_repository.id
#     push {
#       branch = "dev-app*"
#     }
#   }

#   filename = "cloudbuild-app.yaml"
# }