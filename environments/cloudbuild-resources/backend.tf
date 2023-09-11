terraform {
  backend "gcs" {
    bucket                      = "presales-team-mahesh-15jul-tfstate"
    prefix                      = "cloudbuild-triggers-dev"
  }
}