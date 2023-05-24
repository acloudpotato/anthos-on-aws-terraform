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
 
 resource "google_container_aws_node_pool" "default" {
  count     =  var.no_of_node_pool
  name      = "${var.nodepool_name}-np-${count.index}"
  cluster   = var.cluster_id
  subnet_id = var.node_pool_subnet_id
  version   = var.cluster_version
  location  = var.cluster_location
  max_pods_constraint {
    max_pods_per_node = var.max_pods_per_node
  }
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
  config {
    config_encryption {
      kms_key_arn = var.database_encryption_kms_key_arn
    }
     instance_type        = var.instance_type
     iam_instance_profile = var.iam_np_instance_profile
    root_volume {
      size_gib    = var.size_gib_root_vol_np
      volume_type = var.volume_type
      iops        = var.iops
      kms_key_arn = var.volume_kms_key_arn
    }
    tags = {
      "Name" : "${var.nodepool_name}-nodepool-${count.index}"
    }

  }
  timeouts {
    create = "45m"
    update = "45m"
    delete = "45m"
  }
}