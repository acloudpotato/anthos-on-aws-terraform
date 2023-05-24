module "gcp_data" {
  source       = "../modules/gke_on_aws/gcp-data"
  gcp_location = var.gcp_location
  gcp_project  = var.gcp_project_id
}

data "terraform_remote_state" "vpc" {
  backend = "gcs"
  config = {
    bucket = "<YOUR GCS BUCKET NAME>"
    prefix = "demo/vpc"
  }
}
