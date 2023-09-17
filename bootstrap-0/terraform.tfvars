project_id = "presales-team-mahesh-15jul"

enable_cloudbuild_apis = [
  "cloudbuild.googleapis.com",
  "sourcerepo.googleapis.com",
  "artifactregistry.googleapis.com",
  "serviceusage.googleapis.com",
  "servicenetworking.googleapis.com",
  "compute.googleapis.com",
  "logging.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "iam.googleapis.com",
  "storage-api.googleapis.com",
  "container.googleapis.com"
]


service_accounts = {
  "cicd-tf-sa" = {
    description         = "Project Cloud Build Service Account"
    display_name_prefix = "cicd-tf-sa"
    project_role = [
      "roles/iam.serviceAccountAdmin",
 
    ]
    sa_name_prefix = "cicd-tf-sa"

  }
}


cloudbuild_triggers = {
  "cloudbuild-resources-infra" = {
    trigger_description  = "Trigger for testing cloudbuild project infra components"
    repo_name            = "terraform_gke"
    branch_name          = "dev"
    included_files       = ["terraform-structure/environments/cloudbuild-resources/uat/**"]
    substitutions = {
      _SUBNET            = "presales-team-mahesh-15jul-vpc"
    }
    trigger_name         = "cloudbuild-resources-plan"
    cloudbuild_filename  = "terraform-structure/cloudbuild-plan.yaml"
    filename             = "cloudbuild.yaml"
    approval_required    = false
   },
  # "microservices-run-dev" = {
  #   trigger_description = "Runs skaffold run on main skaffold yaml file"
  #   repo_name           = "cicd-fd-micro"
  #   included_files      = ["**"]
  #   substitutions = {
  #     _PROFILE           = "custom"
  #     _CLUSTER_NAME      = "presales-team-mahesh-15jul-gke"
  #     _PROJECT_ID        = "presales-team-mahesh-15jul"
  #   }
  #   trigger_name        = "microservices-run-dev"
  #   cloudbuild_filename = "cloudbuild-app.yaml"
  #   approval_required   = false
  # }
}


infra_repo = "terraform_gke"
infra_secret_id ="infra-repo"
infra_repo_uri = "https://github.com/shriramgaddam/terraform_gke.git"
github_pat = "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"
installation_id = "41651629"
