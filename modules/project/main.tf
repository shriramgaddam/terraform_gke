
################# project state bucket creation ##################

resource "google_storage_bucket" "state_bucket" {
  name     = "${var.project_name}-tfstate"
  project  = var.project_name
  location = local.location
  versioning {
    enabled = true
  }
  lifecycle_rule {
    condition {
      num_newer_versions = 5
      age                = 30
      with_state         = "ARCHIVED"
    }
    action {
      type = "Delete"
    }
  }
}

