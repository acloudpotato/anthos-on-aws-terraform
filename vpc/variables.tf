variable "region" {
  description = "The region of deployment"
}

variable "vpc_main" {
  description = "The configuration details for Mgmt VPC"
}

variable "tags" {
  description = "The tags for the deployed resources"
}

variable "private_subnet_name_tags" {
  description = "network tags for subnets"
  default     = ["sample-anthos-on-aws-pvt-test-subnet", "sample-eks-pvt-test-subnet-01", "sample-eks-pvt-test-subnet-02"]
}

variable "public_subnet_name_tags" {
  description = "network tags for public"
  default     = ["sample-eks-pub-test-subnet"]
}