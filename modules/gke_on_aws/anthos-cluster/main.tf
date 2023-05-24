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
 
data "google_project" "project" {
}

output "project_number" {
  value = data.google_project.project.number
}

resource "google_container_aws_cluster" "this" {
  project     = var.fleet_project
  aws_region  = var.aws_region
  provider    = google-beta
  description = "Test AWS cluster created with Terraform"
  location    = var.location
  name        = var.anthos_prefix
  authorization {
    admin_users {
      username = var.admin_user
    }
  }
  logging_config {
    component_config{
      enable_components  = ["SYSTEM_COMPONENTS","WORKLOADS"]
    }
   }
  control_plane {
    iam_instance_profile = var.iam_cp_instance_profile    
    instance_type        = var.control_plane_instance_type
    subnet_ids           = var.subnet_ids
    tags = {
      "Name" : "${var.anthos_prefix}-cp"
    }
    version = var.cluster_version
    aws_services_authentication {
      role_arn = var.role_arn
    }
    config_encryption {
      kms_key_arn = var.database_encryption_kms_key_arn
    }
    database_encryption {
      kms_key_arn = var.database_encryption_kms_key_arn
    }
    main_volume {
      size_gib    = var.size_gib_main_vol_cp 
      volume_type = var.volume_type
      iops        = var.iops 
      kms_key_arn = var.volume_kms_key_arn
    }
    root_volume {
      size_gib    = var.size_gib_root_vol_cp
      volume_type = var.volume_type
      iops        = var.iops
      kms_key_arn = var.volume_kms_key_arn
    }

  }
  networking {
    pod_address_cidr_blocks     = var.pod_address_cidr_blocks
    service_address_cidr_blocks = var.service_address_cidr_blocks
    vpc_id                      = var.vpc_id
  }
  fleet {
    project = var.fleet_project
  }
  timeouts {
    create = "45m"
    update = "45m"
    delete = "45m"
  }
}
