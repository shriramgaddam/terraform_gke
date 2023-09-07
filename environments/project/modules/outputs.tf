
output "project_name" {
  description = "Project Id of the created project"
  value       = module.project.project_name
}

output "tf_state_bucket_name" {
  description = "name of the project state bucket"
  value       = module.project.bucket_name
}

output "tf_state_bucket_url" {
  description = "Self link of the project bucket"
  value       = module.project.bucket_url
}
