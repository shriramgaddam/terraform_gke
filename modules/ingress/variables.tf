
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

variable "cert_issuer_email" {
  type        = string
  description = "environment of the project (dev or prod)"
}

variable "cluster_issuer_name" {
  type        = string
  description = "environment of the project (dev or prod)"
}
variable "private_key_secret_name" {
  type        = string
  description = "environment of the project (dev or prod)"
}


variable "static_ip_name" {
  type        = string
  description = "environment of the project (dev or prod)"
}