locals {
  tf_service_account_emails = {
    for sa_name, sa_attrs in var.service_accounts :
    sa_name => "projects/${var.project_id}/serviceAccounts/${sa_attrs.sa_name_prefix}@${var.project_id}.iam.gserviceaccount.com"
  }
}

resource "google_service_account_iam_member" "cloud_build_service_account_sa_impersonate" {
  for_each           = local.tf_service_account_emails
  service_account_id = each.value
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}


resource "time_sleep" "impersonate_propagation" {
  create_duration = "30s"

  depends_on = [
    google_service_account_iam_member.cloud_build_service_account_sa_impersonate
  ]
}