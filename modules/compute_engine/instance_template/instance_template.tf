module "instance_template" {
  source                       = "terraform-google-modules/vm/google//modules/instance_template"
  version                      = "7.9.0"
  access_config                = var.access_config
  additional_disks             = var.additional_disks
  additional_networks          = var.additional_networks
  alias_ip_range               = var.alias_ip_range
  auto_delete                  = var.auto_delete
  automatic_restart            = var.automatic_restart
  can_ip_forward               = var.can_ip_forward
  disk_encryption_key          = var.disk_encryption_key
  disk_labels                  = var.disk_labels
  disk_size_gb                 = var.disk_size_gb
  disk_type                    = var.disk_type
  enable_confidential_vm       = var.enable_confidential_vm
  enable_nested_virtualization = var.enable_nested_virtualization
  enable_shielded_vm           = var.enable_shielded_vm
  gpu                          = var.gpu
  labels                       = var.labels
  machine_type                 = var.machine_type
  metadata                     = var.metadata
  min_cpu_platform             = var.min_cpu_platform
  name_prefix                  = var.name_prefix
  network                      = var.network
  network_ip                   = var.network_ip
  on_host_maintenance          = var.on_host_maintenance
  preemptible                  = var.preemptible
  project_id                   = var.project_id
  region                       = var.region
  service_account              = var.service_account
  shielded_instance_config     = var.shielded_instance_config
  source_image                 = var.source_image
  source_image_family          = var.source_image_family
  source_image_project         = var.source_image_project
  startup_script               = var.startup_script
  subnetwork                   = var.subnetwork
  subnetwork_project           = var.subnetwork_project
  tags                         = var.tags
  threads_per_core             = var.threads_per_core
}
