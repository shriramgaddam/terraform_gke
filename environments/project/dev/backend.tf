terraform {
  backend "gcs" {
    bucket                      = "presales-team-mahesh-15jul-tfstate"
    prefix                      = "dev"
  }
}