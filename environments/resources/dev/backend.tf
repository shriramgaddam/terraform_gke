terraform {
  backend "gcs" {
    bucket = "presales-team-mahesh-15jul-tfstate"
    prefix = "dev/resources"
  }
}

data "terraform_remote_state" "project" {
  backend = "gcs"
  config = {
    bucket = var.tf_backend_bucket
    prefix = "dev"
  }
}