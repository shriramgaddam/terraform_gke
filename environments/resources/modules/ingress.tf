module "ingress" {
  source            = "../../../modules/ingress"
  cert_issuer_email = var.cert_issuer_email
  api_domain        = var.api_domain
  project_id        = var.project_id
  environment       = var.environment

  depends_on = [
    module.gke, google_compute_security_policy.cloud-armor
  ]

}
