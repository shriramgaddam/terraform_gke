terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.41.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.5.1"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

  }
}
provider "google" {
  project = var.project_id
  #impersonate_service_account = var.tf_impersonate_service_account
  request_timeout = var.provider_request_timeout
  region          = var.default_region
}

provider "google-beta" {
  project = var.project_id
  region  = var.default_region
  #impersonate_service_account = var.tf_impersonate_service_account
}


data "google_client_config" "default" {
}


data "google_container_cluster" "default" {
  # as-is this will probably need to be run a few times
  name = "${var.project_id}-gke"
  # TODO: make this dependency?
  location = var.default_region
  project  = var.project_id
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.default.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.default.master_auth[0].cluster_ca_certificate,
  )

}

provider "kubectl" {
  load_config_file = false
  host             = "https://${data.google_container_cluster.default.endpoint}"
  token            = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.default.master_auth[0].cluster_ca_certificate,
  )
}

provider "helm" {
  kubernetes {
    host  = "https://${data.google_container_cluster.default.endpoint}"
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.default.master_auth[0].cluster_ca_certificate,
    )
  }
}

