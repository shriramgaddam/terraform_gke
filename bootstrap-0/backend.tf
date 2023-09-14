

terraform {
  backend "gcs" {
    bucket = "presales-team-mahesh-15jul-tfstate"
    prefix = "cloudbuild-bootstrap"
    #    impersonate_service_account = "cdle-tf-bootstrap-sa@cdle-fd-baseline-da0a.iam.gserviceaccount.com"
  }
}
