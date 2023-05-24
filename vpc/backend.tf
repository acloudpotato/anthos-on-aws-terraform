terraform {
  backend "gcs" {
    bucket = "demo-platform-tfstate-backend-bucket"
    prefix = "aws/env/demo/global/vpc"
  }
}
