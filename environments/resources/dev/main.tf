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
  ip_range_pods              = "secondary-pod-range-dev"
  ip_range_services          = "secondary-service-range-dev"
  cert_issuer_email          = var.cert_issuer_email
  cloud_armor_rules          = var.cloud_armor_rules
  api_domain                 = var.api_domain

}

