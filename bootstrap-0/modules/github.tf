

// Create a secret containing the personal access token and grant permissions to the Service Agent
resource "google_secret_manager_secret" "github_token_secret" {
    project =  var.project_id
    secret_id = var.infra_secret_id

    replication {
        automatic = true
    }
}

resource "google_secret_manager_secret_version" "github_token_secret_version" {
    secret = google_secret_manager_secret.github_token_secret.id
    secret_data = var.github_pat
}

data "google_project" "project" {
    project_id = var.project_id
}

output "project_number" {
  value = data.google_project.project.number
}

data "google_iam_policy" "serviceagent_secretAccessor" {
    binding {
        role = "roles/secretmanager.secretAccessor"
        members = ["serviceAccount:service-${data.google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
    }
}

resource "google_secret_manager_secret_iam_policy" "policy" {
  project = google_secret_manager_secret.github_token_secret.project
  secret_id = google_secret_manager_secret.github_token_secret.secret_id
  policy_data = data.google_iam_policy.serviceagent_secretAccessor.policy_data
}

// Create the GitHub connection
resource "google_cloudbuildv2_connection" "infra_connection" {
    project = var.project_id
    location = var.default_region
    name = "boot-connect"

    github_config {
        app_installation_id = var.installation_id
        authorizer_credential {
            oauth_token_secret_version = google_secret_manager_secret_version.github_token_secret_version.id
        }
    }
    depends_on = [google_secret_manager_secret_iam_policy.policy]
}


resource "google_cloudbuildv2_repository" "infra_repository" {
    project = var.project_id
    location = var.default_region
    name = var.infra_repo
    parent_connection = google_cloudbuildv2_connection.infra_connection.name
    remote_uri = var.infra_repo_uri
    
  }