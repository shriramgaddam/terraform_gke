module "gke" {
  source                     = "../../../modules/gke"
  project_id                 = var.project_id
  name                       = "${var.project_id}-gke"
  network_project_id         = var.project_id
  region                     = var.default_region
  gke_cluster_zones          = var.gke_cluster_zones
  network                    = "${var.vpc_common_name}-vpc"
  subnetwork                 = "${var.project_id}-subnet-${var.environment}"
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  master_authorized_networks = []
  node_pools                 = [
    {
      name               = "gke-np-cpu-${var.environment}"
      machine_type       = "e2-standard-2"
      min_count          = "1"
      max_count          = "6"
      disk_size_gb       = "30"
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      auto_repair        = true
      auto_upgrade       = true
      # hard coding until resolved: https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/issues/991
      service_account    = module.service_accounts["gke-node-sa"].email
      preemptible        = false
      initial_node_count = "1"

      enable_secure_boot = true
    },
  ]
  depends_on = [
    module.network
  ]
}

# Creating a Kubernetes Service account for Workload Identity
resource "kubernetes_service_account" "ksa" {
  metadata {
    name = "ksa"
    annotations = {
      "iam.gke.io/gcp-service-account" = module.service_accounts["gke-pod-sa"].email
    }
  }
  depends_on = [
    module.gke
  ]
}
# Enable the IAM binding between YOUR-GSA-NAME and YOUR-KSA-NAME:
resource "google_service_account_iam_binding" "gsa-ksa-binding" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${module.service_accounts["gke-pod-sa"].email}"
  role               = "roles/iam.workloadIdentityUser"
  members = [
    "serviceAccount:${var.project_id}.svc.id.goog[default/ksa]"
  ]
  depends_on = [
    module.gke
  ]
}


