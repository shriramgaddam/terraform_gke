module "ingress" {
  source                  = "../../../modules/ingress"
  api_domain              = var.api_domain
  project_id              = var.project_id
  environment             = var.environment
  cert_issuer_email       = var.cert_issuer_email
  cluster_issuer_name     = var.cluster_issuer_name
  private_key_secret_name = var.private_key_secret_name
  static_ip_name          = var.static_ip_name


  depends_on = [
    module.gke, google_compute_security_policy.cloud-armor
  ]

}
