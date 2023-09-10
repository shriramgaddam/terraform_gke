# module "bootstrap_setup" {
#   source          = "./modules"
#   root_folders    = var.root_folders
#   project_folders = var.project_folders
#   organization_id = var.organization_id
#   # parent_folder      = local.parent_folder
#   bootstrap_projects         = var.bootstrap_projects
#   common_projects            = var.common_projects
#   cb_resources_trigger       = var.cb_resources_trigger
#   foundation_sa_iam_bindings = var.foundation_sa_iam_bindings
# }


// Create a secret containing the personal access token and grant permissions to the Service Agent
resource "google_secret_manager_secret" "github_token_secret" {
    project =  "presales-team-mahesh-15jul"
    secret_id = "cb-test"

    replication {
        automatic = true
    }
}

resource "google_secret_manager_secret_version" "github_token_secret_version" {
    secret = google_secret_manager_secret.github_token_secret.id
    secret_data = "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"
}

data "google_iam_policy" "serviceagent_secretAccessor" {
    binding {
        role = "roles/secretmanager.secretAccessor"
        members = ["serviceAccount:service-119083170228@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
    }
}

resource "google_secret_manager_secret_iam_policy" "policy" {
  project = google_secret_manager_secret.github_token_secret.project
  secret_id = google_secret_manager_secret.github_token_secret.secret_id
  policy_data = data.google_iam_policy.serviceagent_secretAccessor.policy_data
}


// Create the GitHub connection
resource "google_cloudbuildv2_connection" "my_connection" {
    project = "presales-team-mahesh-15jul"
    location = "us-central1"
    name = "boot-connect"

    github_config {
        app_installation_id = "41651629"
        authorizer_credential {
            oauth_token_secret_version = google_secret_manager_secret_version.github_token_secret_version.id
        }
    }
    depends_on = [google_secret_manager_secret_iam_policy.policy]
}


resource "google_cloudbuildv2_repository" "my_repository" {
    project = "presales-team-mahesh-15jul"
    location = "us-central1"
    name = "terraform_gke"
    parent_connection = google_cloudbuildv2_connection.my_connection.name
    remote_uri = "https://github.com/shriramgaddam/terraform_gke.git"
  }


resource "google_cloudbuild_trigger" "repo-trigger" {
  location = "us-central1"
  project = "presales-team-mahesh-15jul"
  name    =  "dev-branch"

  repository_event_config {
    repository = google_cloudbuildv2_repository.my_repository.id
    push {
      branch = "de.*"
    }
  }

  filename = "cloudbuild.yaml"
}