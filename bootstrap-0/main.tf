module "cloud_build" {
  source = "./modules"
  enable_cloudbuild_apis  = var.enable_cloudbuild_apis
  service_accounts        = var.service_accounts
  project_id              = var.project_id
  cloudbuild_triggers     = var.cloudbuild_triggers
  default_region          = var.default_region
  infra_repo              = var.infra_repo
  infra_secret_id         = var.infra_secret_id
  infra_repo_uri          = var.infra_repo_uri
  github_pat              = var.github_pat
  installation_id         = var.installation_id
  group_cloudbuild_admins = var.group_cloudbuild_admins
  cloud_source_repos      = var.cloud_source_repos
  cb_resources_trigger    = var.cb_resources_trigger


  
  #group_admins           = var.group_cloudbuild_admins
  #   tf_service_accounts = {
  #     "tf-non-prod-env" = "projects/${var.bootstrap_project_id}/serviceAccounts/${var.tf_impersonate_service_account}",
  #   }
  

}


