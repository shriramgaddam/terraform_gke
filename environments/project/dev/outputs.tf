
output "tf_state_bucket" {
  description = "Name of the project state bucket"
  value       = module.project.tf_state_bucket_name
}
output "tf_state_bucket_url" {
  description = "Self link of the project bucket"
  value       = module.project.tf_state_bucket_url
}

