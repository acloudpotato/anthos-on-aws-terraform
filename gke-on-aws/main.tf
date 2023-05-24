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

resource "random_string" "suffix" {
  length    = 2
  special   = false
  lower     = true
  min_lower = 2
}

module "kms" {
  source        = "../modules/gke_on_aws/kms"
  anthos_prefix = local.name_prefix
}

module "iam" {
  source             = "../modules/gke_on_aws/iam"
  gcp_project_number = module.gcp_data.project_number
  anthos_prefix      = local.name_prefix
  db_kms_arn         = module.kms.database_encryption_kms_key_arn
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "sleep 30"
  }
  depends_on = [module.iam, module.kms]
}

module "anthos_cluster" {
  source                          = "../modules/gke_on_aws/anthos-cluster"
  anthos_prefix                   = local.name_prefix
  location                        = var.gcp_location
  aws_region                      = var.aws_region
  control_plane_instance_type     = var.control_plane_instance_type
  cluster_version                 = coalesce(var.cluster_version, module.gcp_data.latest_version)
  database_encryption_kms_key_arn = module.kms.database_encryption_kms_key_arn
  iam_cp_instance_profile         = module.iam.cp_instance_profile_id
  admin_user                      = var.admin_user
  vpc_id                          = data.terraform_remote_state.vpc.outputs.main_vpc_id
  pod_address_cidr_blocks         = var.pod_address_cidr_blocks
  service_address_cidr_blocks     = var.service_address_cidr_blocks
  role_arn                        = module.iam.api_role_arn
  size_gib_main_vol_cp            = var.size_gib_main_vol_cp
  size_gib_root_vol_cp            = var.size_gib_root_vol_cp
  volume_type                     = var.volume_type
  iops                            = var.iops
  subnet_ids                      = [data.terraform_remote_state.vpc.outputs.main_private_subnets[0]]
  fleet_project                   = "projects/${module.gcp_data.project_number}"
  depends_on                      = [module.kms, module.iam, resource.null_resource.cluster]
}

module "nodepool" {
  source                          = "../modules/gke_on_aws/node-pool"
  no_of_node_pool                 = var.no_of_node_pool
  nodepool_name                   = local.name_prefix
  cluster_id                      = module.anthos_cluster.anthos_cluster_id
  cluster_location                = module.anthos_cluster.location
  max_pods_per_node               = var.max_pods_per_node
  max_node_count                  = var.max_node_count
  size_gib_root_vol_np            = var.size_gib_root_vol_np
  min_node_count                  = var.min_node_count
  iops                            = var.iops
  volume_type                     = var.volume_type
  instance_type                   = var.node_pool_instance_type
  cluster_version                 = coalesce(var.cluster_version, module.gcp_data.latest_version)
  database_encryption_kms_key_arn = module.kms.database_encryption_kms_key_arn
  iam_np_instance_profile         = module.iam.np_instance_profile_id
  node_pool_subnet_id             = data.terraform_remote_state.vpc.outputs.main_private_subnets[0]
  depends_on                      = [module.kms, module.iam, module.anthos_cluster]

}

