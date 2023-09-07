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
  }

  required_version = ">= 1.1.0"
}

data "google_client_config" "default" {
}
