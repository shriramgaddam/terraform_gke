
module "project" {
  source      = "../modules"
  project_id  = var.project_id
  
}

 
resource "google_project_iam_binding" "project-cbsa" {
  project = var.project_id
  role    = "roles/container.developer"

  members = [
    "serviceAccount:119083170228@cloudbuild.gserviceaccount.com",
  ]
}

