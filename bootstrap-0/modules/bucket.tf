################# project state bucket creation ##################

resource "google_storage_bucket" "state_bucket" {
  name     = "${var.project_id}-tfstate"
  project  = var.project_id
  location = var.default_region
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