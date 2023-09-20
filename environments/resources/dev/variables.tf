variable "environment" {
  type        = string
  description = "environment of the project (dev or prod)"
}

variable "project_id" {
  type        = string
  description = "Project ID to deploy resources"
}

variable "routing_mode" {
  description = "The network routing mode (default 'GLOBAL')"
  type        = string
  default     = "GLOBAL"
}

variable "subnets" {
  description = "The list of subnets being created"
  type        = list(map(string))
}

variable "secondary_ranges" {
  description = "Secondary ranges that will be used in some of the subnets"
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  default     = {}
}

variable "firewall_rules" {
  description = "List of firewall rules"
  type        = any
  default     = []
}

variable "default_region" {
  type        = string
  description = "Default region for all cloud resources"
  default     = "us-central1"
}

variable "service_sas" {
  type = map(object({

    description         = string
    display_name_prefix = string
    sa_name_prefix      = string
    project_role        = list(string)
  }))
}

variable "gke_cluster_zones" {
  type        = list(string)
  description = "specify the zones for the cluster region"
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."

}

variable "cert_issuer_email" {
  type        = string
  description = "email of the cert issuer"
}

variable "cloud_armor_rules" {
  type = list(object({
    action      = string
    priority    = number
    description = string
    match = list(object({
      versioned_expr = string
      config = object({
        src_ip_ranges = list(string)
      })
    }))
  }))
}

variable "api_domain" {
  type        = string
  description = "api domain name"
}

variable "tf_backend_bucket" {
  type        = string
  description = "Terraform state bucket"
}

variable "provider_request_timeout" {
  description = "Request timeput for the google provider"
  type        = string
  default     = "60s"
}

variable "private_key_secret_name" {
  type        = string
  description = "environment of the project (dev or prod)"
}

variable "cluster_issuer_name" {
  type        = string
  description = "environment of the project (dev or prod)"
}

variable "static_ip_name" {
  type        = string
  description = "environment of the project (dev or prod)"
}


variable "tf_impersonate_service_account" {
  type        = string
  description = "Service account to impersonate to run terraform"
}

