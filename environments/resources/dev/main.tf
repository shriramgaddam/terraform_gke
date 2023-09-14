locals {
  secondary_ranges = var.secondary_ranges
  range_key        = "${var.project_id}-subnet-${var.environment}"
}

# Extract the range_name values for ip_range_pods and ip_range_services
locals {
  
  ip_range_pods     = local.secondary_ranges[local.range_key][0].range_name
  ip_range_services = local.secondary_ranges[local.range_key][1].range_name
}


module "resources" {
  source                     = "../modules"
  environment                = var.environment
  project_id                 = var.project_id
  vpc_common_name            = var.project_id
  routing_mode               = var.routing_mode
  subnets                    = var.subnets
  secondary_ranges           = var.secondary_ranges
  firewall_rules             = var.firewall_rules
  default_region             = var.default_region
  service_sas                = var.service_sas
  gke_cluster_zones          = var.gke_cluster_zones
  master_authorized_networks = var.master_authorized_networks
  ip_range_pods              = local.ip_range_pods
  ip_range_services          = local.ip_range_services
  cert_issuer_email          = var.cert_issuer_email
  cluster_issuer_name        = var.cluster_issuer_name
  private_key_secret_name    = var.private_key_secret_name
  cloud_armor_rules          = var.cloud_armor_rules
  api_domain                 = var.api_domain
  static_ip_name             = var.static_ip_name

}

