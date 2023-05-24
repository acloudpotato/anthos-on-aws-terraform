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
 
variable "cluster_id" {
  description   = "Anthos cluster name"
  type          = string
}

variable "cluster_location" {
  description   = "Anthos cluster location"
  type          = string
}

variable "cluster_version" {
  description   = "Anthos cluster version"
  type          = string
}

variable "database_encryption_kms_key_arn" {
  description   = "KMS Key for data encrytion"
  type          = string
}

variable "iam_np_instance_profile" {
  description   = "AWS IAM Instance profile to be attached to the Node Pool nodes"
  type          = string  
}

variable "no_of_node_pool" {
  description   = "Number of nodepools need to be created"
  type          = string
}

variable "volume_kms_key_arn" {
  description   = "KMS Key for encrypting EBS volumes"
  type          = string
  default = null
}

variable "size_gib_root_vol_np" {
  description   = "size of node-pool root volume"
  type          = number
  default       = 30
}

variable "iops" {
  description   = "iops value of node-pool main and root volume"
}

variable "volume_type" {
  description   = "volume type"
}

variable "node_pool_subnet_id" {
  description   = "Subnet id for the Node pools"
  type          = string  
}


variable "nodepool_name" {
  description   = "Prefix to be used in anthos resources"
  type          = string  
}

variable "instance_type" {
  description   = "type of the instance of your nodepools"
  type          = string   
}

variable "max_pods_per_node" {
  description = "maximum availability  of  pods per nodes "
  type        = string 
}

variable "max_node_count" {
  description = "Maximum nodes for autoscaling"
  type        = string 
}

variable "min_node_count" {
  description = "minimum nodes for autoscaling"
  type        = string
}