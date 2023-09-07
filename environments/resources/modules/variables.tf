variable "environment" {
  type        = string
  description = "environment of the project (dev or prod)"
}

variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "default_region" {
  type        = string
  description = "Default region for all cloud resources"
  default     = "us-central1"
}

##################################  NETWORK vars ##################################

variable "vpc_common_name" {
  description = "The name of the network being created"
  type        = string
}

variable "subnetwork" {
  description = "Subnet to deploy to. Only one of network or subnetwork should be specified."
  default     = ""
}

variable "secondary_ranges" {
  description = "Secondary ranges that will be used in some of the subnets"
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  default     = {}
}

variable "subnets" {
  description = "The list of subnets being created"
  type        = list(map(string))
}

variable "subnet_ip_cidr_range" {
  description = "subnet CIDR range."
  default     = ""
}

variable "create_vpc_peering" {
  type        = bool
  description = "create VPC peering with service networking google apis"
  default     = true
}

variable "ip_range_pods" {
  type        = string
  description = "The _name_ of the secondary subnet ip range to use for pods"
}

variable "ip_range_services" {
  type        = string
  description = "The _name_ of the secondary subnet range to use for services"
}

variable "routes" {
  description = "List of routes being created in this VPC"
  type        = list(map(string))
  default     = []
}

variable "routing_mode" {
  description = "The network routing mode (default 'GLOBAL')"
  type        = string
  default     = "GLOBAL"
}


variable "firewall_rules" {
  description = "List of firewall rules"
  type        = any
  default     = []
}


################################## Cloud Armor vars ###############################


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


################################## GKE vars ###############################

variable "gke_cluster_zones" {
  type        = list(string)
  description = "specify the zones for the cluster region"
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default = []
}

variable "service_sas" {
  type = map(object({
    description         = string
    display_name_prefix = string
    sa_name_prefix      = string
    project_role        = list(string)
  }))
}

################################## ingress vars ###############################

variable "cert_issuer_email" {
  type        = string
  description = "email of the cert issuer"
}

variable "api_domain" {
  type        = string
  description = "api domain name"
}



