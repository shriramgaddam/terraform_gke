
resource "google_cloudbuild_trigger" "cloud_build_trigger" {
  for_each = var.cloudbuild_triggers

  description = each.value.trigger_description
  name        = each.value.trigger_name
  project     = module.cloudbuild_project.project_id

  trigger_template {
    tag_name  = each.value.tag_name
    repo_name = each.value.repo_name
  }

  included_files = each.value.included_files
  substitutions  = each.value.substitutions
  filename       = each.value.cloudbuild_filename


  depends_on = [
    module.cloudbuild_project, google_project_iam_member.cloudbuild_editor
  ]

}

