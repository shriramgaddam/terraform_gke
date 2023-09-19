output "cloudbuild_project_number" {
  description = "CloudBuild project number"
  value       = data.google_project.project.number
}


# output "service_account" {
#   description = "Service account resource (for single use)."
#   value       = module.service_accounts.service_account
# }

# output "email" {
#   description = "Service account email (for single use)."
#   value       = module.service_accounts.email
# }

# output "emails" {
#   description = "The service account emails."
#   value       = module.service_accounts.emails
# }