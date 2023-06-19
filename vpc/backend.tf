terraform {
  backend "gcs" {
    bucket = "<YOUR GCS BUCKET NAME>"
    prefix = "demo/vpc"
  }
}
