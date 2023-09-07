module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version                    = "v23.2.0"
  project_id                 = var.project_id
  name                       = var.name
  network_project_id         = var.network_project_id
  #kubernetes_version         = var.kubernetes_version
  region                     = var.region
  regional                   = true
  zones                      = var.gke_cluster_zones
  network                    = var.network
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  http_load_balancing        = true
  identity_namespace         = "enabled"
  horizontal_pod_autoscaling = true
  network_policy             = true
  enable_private_endpoint    = false
  enable_private_nodes       = false
  master_ipv4_cidr_block     = "172.26.1.16/28"
  master_authorized_networks = var.master_authorized_networks
  create_service_account     = false
  remove_default_node_pool   = true
  node_pools                 = var.node_pools

  enable_binary_authorization = true

  #testing
  add_cluster_firewall_rules = true
  add_shadow_firewall_rules  = true
  #  shadow_firewall_rules_priority = 1001

  #  shadow_firewall_rules_log_config = var.shadow_firewall_rules_log_config


  node_pools_oauth_scopes = {

    node-pool-01 = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }


  node_pools_metadata = {
    node-pool-01 = {
      disable-legacy-endpoints = "true"
    }
  }


  node_pools_taints = {
    node-pool-01 = []
  }

}

