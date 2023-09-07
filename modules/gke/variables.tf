variable "project_id" {
  type        = string
  description = "project ID"
}

variable "name" {
  type        = string
  description = "The name of the cluster (required)"
}

variable "region" {
  type        = string
  description = "cluster region"
}

#variable "zones" {
#  type        = list(string)
#  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
#  default     = []
#}

variable "gke_cluster_zones" {
  type        = list(string)
  description = "specify the zones for the cluster region"
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
}

variable "ip_range_pods" {
  type        = string
  description = "The _name_ of the secondary subnet ip range to use for pods"
}

variable "ip_range_services" {
  type        = string
  description = "The _name_ of the secondary subnet range to use for services"
}

variable "network" {
  type        = string
  description = "The VPC network to host the cluster in (required)"
}

variable "network_project_id" {
  type        = string
  description = "The project ID of the shared VPC's host (for shared vpc support)"
  default     = ""
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to host the cluster in (required)"
}

# variable "kubernetes_version" {
#   type        = string
#   description = "Kubernetes version for gke"
# }

variable "node_pools" {
  type        = list(map(any))
  description = "List of maps containing node pools"

  default = [
    {
      name = "default-node-pool"
    },
  ]
}
variable "shadow_firewall_rules_log_config" {
  type = object({
    metadata = string
  })
  description = "The log_config for shadow firewall rules. You can set this variable to `null` to disable logging."
  default = {
    metadata = "INCLUDE_ALL_METADATA"
  }
}