# module "default_sa_host_iam" {
#   source               = "../../../modules/cloud_iam/project_iam"
#   project_names        = [var.project_id]
#   project_iam_bindings = local.host_sa_project_bindings
#   depends_on = [
#     module.service_project
#   ]
# }