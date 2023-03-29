module "gke" {
  source                            = "terraform-google-modules/kubernetes-engine/google"
  project_id                        = var.project_id
  name                              = var.name
  region                            = var.region
  zones                             = var.zones
  network                           = var.network
  subnetwork                        = var.subnetwork
  ip_range_pods                     = var.ip_range_pods
  ip_range_services                 = var.ip_range_services
  http_load_balancing               = var.http_load_balancing
  network_policy                    = var.network_policy
  horizontal_pod_autoscaling        = var.horizontal_pod_autoscaling
  add_cluster_firewall_rules        = var.add_cluster_firewall_rules
  add_master_webhook_firewall_rules = var.add_master_webhook_firewall_rules
  add_shadow_firewall_rules         = var.add_shadow_firewall_rules
  authenticator_security_group      = var.authenticator_security_group

  cluster_autoscaling  = var.cluster_autoscaling
  cluster_dns_domain   = var.cluster_dns_domain
  cluster_dns_provider = var.cluster_dns_provider
  cluster_dns_scope    = var.cluster_dns_scope
  cluster_ipv4_cidr    = var.cluster_ipv4_cidr

  filestore_csi_driver    = var.filestore_csi_driver
  cluster_resource_labels = var.cluster_resource_labels
  configure_ip_masq       = var.configure_ip_masq
  create_service_account  = var.create_service_account

  database_encryption               = var.database_encryption
  datapath_provider                 = var.datapath_provider
  default_max_pods_per_node         = var.default_max_pods_per_node
  description                       = var.description
  disable_default_snat              = var.disable_default_snat
  disable_legacy_metadata_endpoints = var.disable_legacy_metadata_endpoints
  dns_cache                         = var.dns_cache

  enable_binary_authorization        = var.enable_binary_authorization
  enable_cost_allocation             = var.enable_cost_allocation
  enable_kubernetes_alpha            = var.enable_kubernetes_alpha
  enable_network_egress_export       = var.enable_network_egress_export
  enable_resource_consumption_export = var.enable_resource_consumption_export
  enable_shielded_nodes              = var.enable_shielded_nodes
  enable_vertical_pod_autoscaling    = var.enable_vertical_pod_autoscaling

  firewall_inbound_ports = var.firewall_inbound_ports
  firewall_priority      = var.firewall_priority

  gateway_api_channel     = var.gateway_api_channel
  gce_pd_csi_driver       = var.gce_pd_csi_driver
  gke_backup_agent_config = var.gke_backup_agent_config
  grant_registry_access   = var.grant_registry_access
  identity_namespace      = var.identity_namespace
  initial_node_count      = var.initial_node_count

  ip_masq_link_local       = var.ip_masq_link_local
  ip_masq_resync_interval  = var.ip_masq_resync_interval
  issue_client_certificate = var.issue_client_certificate
  kubernetes_version       = var.kubernetes_version

  logging_enabled_components = var.logging_enabled_components
  logging_service            = var.logging_service

  maintenance_end_time       = var.maintenance_end_time
  maintenance_exclusions     = var.maintenance_exclusions
  maintenance_recurrence     = var.maintenance_recurrence
  maintenance_start_time     = var.maintenance_start_time
  master_authorized_networks = var.master_authorized_networks

  monitoring_enable_managed_prometheus = var.monitoring_enable_managed_prometheus
  monitoring_enabled_components        = var.monitoring_enabled_components
  monitoring_service                   = var.monitoring_service

  network_policy_provider = var.network_policy_provider
  network_project_id      = var.network_project_id

  node_metadata                         = var.node_metadata
  node_pools                            = var.node_pools
  node_pools_oauth_scopes               = var.node_pools_oauth_scopes
  node_pools_linux_node_configs_sysctls = var.node_pools_linux_node_configs_sysctls
  node_pools_labels                     = var.node_pools_labels
  node_pools_metadata                   = var.node_pools_metadata
  node_pools_taints                     = var.node_pools_taints
  node_pools_tags                       = var.node_pools_tags
  node_pools_resource_labels            = var.node_pools_resource_labels

  non_masquerade_cidrs      = var.non_masquerade_cidrs
  notification_config_topic = var.notification_config_topic

  regional                         = var.regional
  registry_project_ids             = var.registry_project_ids
  release_channel                  = var.release_channel
  remove_default_node_pool         = var.remove_default_node_pool
  resource_usage_export_dataset_id = var.resource_usage_export_dataset_id

  service_account                  = var.service_account
  service_external_ips             = var.service_external_ips
  shadow_firewall_rules_log_config = var.shadow_firewall_rules_log_config
  shadow_firewall_rules_priority   = var.shadow_firewall_rules_priority

  skip_provisioners = var.skip_provisioners
  stub_domains      = var.stub_domains

  timeouts             = var.timeouts
  upstream_nameservers = var.upstream_nameservers

  windows_node_pools = var.windows_node_pools

}