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
 
variable "location" {
  description   = "Location where Anthos Infra will be deployed"
  type          = string
}

variable "aws_region" {
  description   = "AWS Region for the resources to be deployed"
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


variable "size_gib_main_vol_cp" {
  description   = "size of of control plane main volume"
  type          = number
  default       = 30
}

variable "size_gib_root_vol_cp" {
  description   = "size of of control plane root volume"
  type          = number
  default       = 30
}

variable "iops" {
  description   = "iops value of cluster main and root volume"
  type          = number
}

variable "volume_type" {
  description   = "volume type"
  type          = string 
}

variable "iam_cp_instance_profile" {
  description   = "AWS IAM Instance profile to be attached to the Control Plane nodes"
  type          = string 
}


variable "pod_address_cidr_blocks" {
  description   = "Kubernetes Pod address CIDR range"
  type          = list(string)
}

variable "service_address_cidr_blocks" {
  description   = "Kubernetes Service address CIDR range"
  type          = list(string)
}

variable "admin_user" {
  description   = "GCP user name to login to Anthos cluster"
  type          = string
}

variable "vpc_id" {
  description   = "ID of AWS VPC"
  type          = string 
}
variable "subnet_ids" {
  description   = "ID of the subnets present in VPC"
  type          = list(string)
}

variable "volume_kms_key_arn" {
  description   = "KMS Key for encrypting EBS volumes"
  type          = string
  default = null
}

variable "role_arn" {
  description   = "AWS IAM role ARN"
  type          = string  
}

variable "fleet_project" {
  description   = "GCP Project"
  type          = string  
}

variable "anthos_prefix" {
  description   = "Prefix to be used in anthos resources"
  type          = string  
}

variable "control_plane_instance_type" {
  description = "instance type for control plane"
  type        = string 
}