
output "service_account" {
  description = "Service account resource (for single use)."
  value       = module.service_account.service_account
}

output "email" {
  description = "Service account email (for single use)."
  value       = module.service_account.email
}

output "iam_email" {
  description = "IAM-format service account email (for single use)."
  value       = module.service_account.iam_email
}

output "emails" {
  description = "The service account emails."
  value       = module.service_account.emails
}
# output "emails_list" {
#   description = "The service account emails as a list."
#   value       = module.service_account.emails_list
# }