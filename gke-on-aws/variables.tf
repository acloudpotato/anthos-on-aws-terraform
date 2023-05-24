/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "aws_region" {
  description = "AWS Region to use for VPC"
  type        = string
}

variable "gcp_project_id" {
  description = "Enter the project id of the gcp project where the cluster will be registered."
  type        = string
}

variable "name_prefix" {
  description = "Prefix to apply to all artifacts created."
  type        = string
  default     = "pilot-as-tf"
}

variable "size_gib_main_vol_cp" {
  description = "size of of control plane main volume"
  type        = number
  default     = 30
}

variable "size_gib_root_vol_cp" {
  description = "size of of control plane root volume"
  type        = number
  default     = 30
}

variable "size_gib_root_vol_np" {
  description = "size of node-pool root volume"
  type        = number
  default     = 30
}

variable "iops" {
  description = "iops value of node-pool and cluster main and root volume"
  type        = number
}

variable "volume_type" {
  description = "volume type"
  type        = string
}

# This step sets up the default RBAC policy in your cluster for a Google
# user so you can login after cluster creation
variable "admin_user" {
  description = "User to get default Admin RBAC"
  type        = string
  default     = ""
}

variable "cluster_version" {
  description = "GKE version to install"
  type        = string
  default     = "1.21.5-gke.2800"
}

# Use the following command to identify the correct GCP location for a given AWS region
#gcloud container aws get-server-config --location [gcp-region]

variable "gcp_location" {
  description = "GCP location to deploy to"
  type        = string
  default     = "us-east4"
}


variable "no_of_node_pool" {
  description = "Number of nodepools need to be created"
  type        = string
}

variable "pod_address_cidr_blocks" {
  description = "CIDR Block to use for pod subnet"
  type        = list(string)
  default     = ["sample.4.0/22"]
}

variable "service_address_cidr_blocks" {
  description = "CIDR Block to use for service subnet"
  type        = list(string)
  default     = ["sample.8.0/22"]
}

variable "node_pool_instance_type" {
  description = "AWS Node instance type"
  type        = string
}

variable "tags" {
  description = "The tags for the deployed resources"
  type        = map(string)
}


variable "max_pods_per_node" {
  description = "maximum availability  of  pods per nodes "
  type        = string
  default     = "110"
}

variable "max_node_count" {
  description = "Maximum nodes for autoscaling"
  type        = string
  default     = "1"
}

variable "min_node_count" {
  description = "minimum nodes for autoscaling"
  type        = string
  default     = "1"
}


variable "control_plane_instance_type" {
  description = "Instance type for control plane"
  type        = string
}


variable "existing_vpc_id" {
  type        = string
  default     = ""
  description = "VPC ip of existing vpc"
}

variable "existing_cp_subnet_ids" {
  type        = list(string)
  default     = [""]
  description = "Subnet ID of control plane of existing vpc"
}

variable "existing_np_subnet_ids" {
  default     = ""
  description = "Subnet ID of nodepool of existing vpc"
}

## ACM Variables ##

variable "hub_project_id" {
  description = "anthos service mesh host  project in which the cluster is going to register."
  type        = string
}

variable "sync_repo" {
  description = " The URL of the Git repository to use as the source of truth"
  type        = string
}
variable "sync_branch" {
  description = "The branch of the repository to sync from"
  type        = string
  default     = "master"
}

variable "policy_dir" {
  description = "The path within the Git repository that represents the top level of the repo to sync"
  type        = string
}
variable "secret_type" {
  description = "Type of secret configured for access to the Git repo"
  type        = string
  default     = "token"
}
variable "hub_membership_labels" {
  type        = map(string)
  description = "Labels to apply to this membership"
  default     = {}
}

variable "exemptable_namespaces" {
  type        = list(string)
  description = "he set of namespaces that are excluded from Policy Controller checks. Namespaces do not need to currently exist on the cluster"
  default     = []
}
variable "enable_acm" {
  description = "Determines whether the module enables acm."
  type        = bool
  default     = false
}
