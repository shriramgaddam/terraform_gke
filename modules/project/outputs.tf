output "bucket_name" {
  description = "name of the project state bucket"
  value       = google_storage_bucket.state_bucket.name
}
output "bucket_url" {
  description = "Self link of the project bucket"
  value       = google_storage_bucket.state_bucket.url
}

output "project_name" {
  description = "Project Id of the created project"
  value       = var.project_name
}