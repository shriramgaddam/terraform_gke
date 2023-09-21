/******************************************
  Create Cloud Source Repos
*******************************************/

resource "google_sourcerepo_repository" "gcp_repo" {
  for_each = var.create_cloud_source_repos ? toset(var.cloud_source_repos) : []
  project  = var.project_id
  name     = each.value
}

/******************************************
  Cloud Source Repo IAM
*******************************************/

resource "google_project_iam_member" "org_admins_source_repo_admin" {
  for_each   = var.create_cloud_source_repos ? toset(var.group_cloudbuild_admins) : []
  project = var.project_id
  role    = "roles/source.admin"
  member  = each.key
  
}


/***********************************************
 Cloud Build - Main branch triggers
 ***********************************************/

resource "google_cloudbuild_trigger" "cb_csr_trigger" {
   for_each = var.cb_resources_trigger
  location = var.default_region
  project = var.project_id

  name    =  each.value.trigger_name
  description = each.value.trigger_description
  included_files       = each.value.included_files

trigger_template {
    branch_name = each.value.branch_name
    repo_name   = each.value.repo_name
  }
  substitutions  = each.value.substitutions

  filename = each.value.cloudbuild_filename
}
