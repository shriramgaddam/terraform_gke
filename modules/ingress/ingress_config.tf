

resource "google_compute_ssl_policy" "ssl-policy" {
  name            = "${var.project_id}-ssl-policy"
  profile         = "RESTRICTED"
  min_tls_version = "TLS_1_2"
}

resource "kubectl_manifest" "frontendconfig" {
  yaml_body = <<YAML

apiVersion: networking.gke.io/v1beta1
kind: FrontendConfig
metadata:
  name: frontend-config
spec:
  sslPolicy: "${var.project_id}-ssl-policy"
  redirectToHttps:
    enabled: true



YAML

  depends_on = [
    google_compute_ssl_policy.ssl-policy
  ]

}


resource "kubectl_manifest" "backendconfig" {
  provider  = kubectl
  yaml_body = <<YAML

apiVersion: cloud.google.com/v1
kind: BackendConfig
metadata:
  name: app-poc-backend
spec:
  healthCheck:
    type: HTTP
    requestPath: /healthz
  securityPolicy:
    name: "${var.project_id}-cloudarmor"

YAML

}