locals {
  #conditional variables
  #sa_created         = var.default_service_account == "keep" ? true : false
  #is_tf_state_bucket = var.tf_state_bucket_name == null ? false : true
  #is_sa_binding      = var.sa_bindings == null ? false : true

  #state bucket config
  location   = "US"
  
}