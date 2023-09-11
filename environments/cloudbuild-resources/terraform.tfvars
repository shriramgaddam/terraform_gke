 ################################ triggers for GKE Application code ########################


  project_id = "presales-team-mahesh-15jul"



# cloudbuild_triggers = {

#   "sample-app-run-dev" = {
#     trigger_description = "Runs skaffold run on skaffold.yaml file"
#     repo_name           = "cicd-fd-micro"
#     included_files      = ["**"]
#     substitutions = {

#       _CLUSTER_NAME      = "presales-team-mahesh-15jul-gke"
#       _PROJECT_ID        = "presales-team-mahesh-15jul"
      
#     }
#     trigger_name        = "sample-app-run-dev"
#     cloudbuild_filename = "cb-microservices.yaml"
#     approval_required   = false
#   }
# }