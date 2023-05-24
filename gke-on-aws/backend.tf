/******************************************
	GCS Bucket configuration for Terraform State management
 *****************************************/
terraform {
  backend "gcs" {
    bucket = "<YOUR GCS BUCKET NAME>"
    prefix = "aws/demo/gke_on_aws"
  }
}
