variable "region" {
  description = "Name of the region"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "kubeconfig_path" {
  description = "directory path of kube config"
}

variable "oidc_url" {
   description = "The URL on the EKS cluster for the OpenID Connect identity provider"
}

variable "context" {
  description = "The Amazon Resource Name (ARN) of the cluster"
}

variable "project_id" {
  description = "name of the project"
}