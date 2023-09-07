variable "cert_issuer_email" {
  type        = string
  description = "email of the cert issuer"
}

variable "api_domain" {
  type        = string
  description = "api domain name"
}

variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "environment" {
  type        = string
  description = "environment of the project (dev or prod)"
}