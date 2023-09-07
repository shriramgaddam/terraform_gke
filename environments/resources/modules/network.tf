module "network" {
  source             = "../../../modules/vpc-network"
  project_id         = var.project_id
  network_name       = "${var.vpc_common_name}-vpc"
  routing_mode       = var.routing_mode
  subnets            = var.subnets
  secondary_ranges   = var.secondary_ranges
  routes             = var.routes
  firewall_rules     = var.firewall_rules
  create_vpc_peering = var.create_vpc_peering
}