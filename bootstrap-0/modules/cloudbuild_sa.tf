
module "service_accounts" {
  for_each      = var.service_accounts
  source        = "../../modules/service_account"
  project_id    = var.project_id
  description   = each.value.description
  display_name  = each.value.display_name_prefix
  name          = each.value.sa_name_prefix
  project_roles = [for i in each.value.project_role : "${var.project_id}=>${i}"]
}