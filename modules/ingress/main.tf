resource "google_compute_global_address" "ipv4" {
  name = "web-ip"
}

module "cert_manager" {
  source = "terraform-iaac/cert-manager/kubernetes"

  cluster_issuer_email                   = "shriram.gaddam@springml.com"
  cluster_issuer_name                    = "letsencrypt-prod"
  cluster_issuer_private_key_secret_name = "letsencrypt"
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
    kubernetes.io/ingress.global-static-ip-name: web-ip
    cert-manager.io/cluster-issuer: letsencrypt-prod
    kubernetes.io/ingress.class: gce
    kubernetes.io/ingress.allow-http: "true"
    acme.cert-manager.io/http01-edit-in-place: "true"
    networking.gke.io/v1beta1.FrontendConfig: "frontend-config"

spec:
  rules:
  - host: "gke-demo.shriramgaddam.com"
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
      - "gke-demo.shriramgaddam.com"
      secretName: letsencrypt
YAML

  depends_on = [
    module.cert_manager
  ]
}

