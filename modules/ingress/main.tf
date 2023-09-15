resource "google_compute_global_address" "ipv4" {
  name = var.static_ip_name
}

module "cert_manager" {
  source = "terraform-iaac/cert-manager/kubernetes"

  cluster_issuer_email                   = var.cert_issuer_email
  cluster_issuer_name                    = var.cluster_issuer_name
  cluster_issuer_private_key_secret_name = var.private_key_secret_name
  solvers = [
    {
      http01 = {
        ingress = {
          class = "app-poc"
        }
      }
    }
  ]
}


resource "kubectl_manifest" "ingress" {
  yaml_body = <<YAML

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-poc
  annotations:
    kubernetes.io/ingress.global-static-ip-name: ${var.static_ip_name}
    cert-manager.io/cluster-issuer: ${var.cluster_issuer_name}
    kubernetes.io/ingress.class: gce
    kubernetes.io/ingress.allow-http: "true"
    cert-manager.io/issue-temporary-certificate: "true"
    acme.cert-manager.io/http01-edit-in-place: "true"
    networking.gke.io/v1beta1.FrontendConfig: "frontend-config"

spec:
  rules:
  - host: ${var.api_domain}
    http:
      paths:
      - pathType: Prefix
        path: /hello
        backend:
          service:
            name: simple-app
            port:
             number: 80

  tls:
    - hosts:
      - ${var.api_domain}
      secretName: ${var.private_key_secret_name}
YAML

  # depends_on = [
  #   module.cert_manager
  # ]
}

