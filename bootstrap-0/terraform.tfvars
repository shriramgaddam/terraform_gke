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
      "roles/editor"
    ]
    sa_name_prefix = "cicd-tf-sa"

  },
   "tf-bootstrap-sa" = {
    description         = "BootStrap Service Account"
    display_name_prefix = "tf-bootstrap-sa"
    project_role = [
      "roles/iam.serviceAccountAdmin",
      "roles/storage.admin",
      "roles/source.admin",
      "roles/iam.serviceAccountUser",
      "roles/iam.serviceAccountAdmin",
      "roles/iam.serviceAccountTokenCreator",
      "roles/servicemanagement.quotaAdmin",
      "roles/serviceusage.serviceUsageAdmin",
      "roles/compute.admin",
      "roles/cloudbuild.builds.editor",  
      "roles/container.admin",     
      "roles/compute.networkAdmin",  
      "roles/storage.admin", 
      "roles/container.clusterAdmin",
      "roles/editor",
      "roles/resourcemanager.projectIamAdmin",
      "roles/container.hostServiceAgentUser",
      "roles/compute.networkUser",
      "roles/compute.networkAdmin",
      "roles/compute.securityAdmin"
    ]
    sa_name_prefix = "tf-bootstrap-sa"
  }
}

####### GITHUB based  ##############

cloudbuild_triggers = {
  "cloudbuild-infra-dev" = {
    trigger_name         = "cloudbuild-trigger-infra-dev"
    trigger_description  = "Trigger for dev cloudbuild project infra components"
    repo_name            = "terraform_gke"
    branch_name          = "dev"
    included_files       = ["environments/project/dev/**","environments/resources/dev/**"]
    #included_files       = ["**"]
    substitutions = {
      _SUBNET            = "presales-team-mahesh-15jul-vpc"
    }
    cloudbuild_filename  = "cloudbuild.yaml"
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
####### CSR based  ##############
cb_resources_trigger = {
  "cb-infra-dev" = {
    trigger_name         = "cb-csr-trigger-infra-dev"
    trigger_description  = "Trigger(CSR) for dev cloudbuild project infra components"
    repo_name            = "gke-demo-infra"
    branch_name          = "dev"
    included_files       = ["environments/project/dev/**","environments/resources/dev/**"]
    #included_files       = ["**"]
    substitutions = {
      _SUBNET            = "presales-team-mahesh-15jul-vpc"
    }
    cloudbuild_filename  = "cloudbuild.yaml"
    approval_required    = false
    trigger_type        = "push"
   },
  "cb-application-dev" = {
    trigger_description = "Trigger(CSR) runs skaffold run on main skaffold yaml file "
    repo_name           = "gke-demo-application"
    branch_name          = "dev"
    included_files      = ["**"]
    substitutions = {
      _PROFILE           = "custom"
      _CLUSTER_NAME      = "presales-team-mahesh-15jul-gke"
      _PROJECT_ID        = "presales-team-mahesh-15jul"
    }
    trigger_name        = "cb-csr-trigger-application-dev"
    cloudbuild_filename = "cloudbuild-app.yaml"
    approval_required   = false
    trigger_type        = "push"
  }
}

infra_repo = "terraform_gke"
infra_secret_id ="infra-repo"
infra_repo_uri = "https://github.com/shriramgaddam/terraform_gke.git"
github_pat = "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"
installation_id = "41651629"


group_cloudbuild_admins = [
  "user:shriram.gaddam@springml.com",
  "serviceAccount:tf-bootstrap-sa@presales-team-mahesh-15jul.iam.gserviceaccount.com"
]

cloud_source_repos = [
    "gke-demo-infra",
    "gke-demo-application",
  ]