export PROJECT_ID=presales-team-mahesh-15jul
export CLUSTER_NAME=presales-team-mahesh-15jul-gke




gcloud container clusters get-credentials $CLUSTER_NAME --region us-central1 --project $PROJECT_ID

skaffold run --default-repo gcr.io/$PROJECT_ID/simple