locals {

  create_command       =  <<-EOT
    aws eks --region ${var.region} update-kubeconfig --name ${var.cluster_name} && gcloud container hub memberships register ${var.cluster_name} --context=${var.context} --kubeconfig=${var.kubeconfig_path} --enable-workload-identity --public-issuer-url=${var.oidc_url} --project=${var.project_id} 
  EOT

  destroy_command = <<-EOT
  aws eks --region ${var.region} update-kubeconfig --name ${var.cluster_name} && gcloud container hub memberships unregister ${var.cluster_name} --context=${var.context}  --kubeconfig=${var.kubeconfig_path} --project=${var.project_id} 
  EOT
}


resource "null_resource" "create_registration" {
  triggers = merge({
    create_command = local.create_command
  })
  
  provisioner "local-exec" {
    when    = create
    command = self.triggers.create_command
  }

}

resource "null_resource" "delete_registration" {
 depends_on = [
   null_resource.create_registration
 ]
  triggers = {
    destroy_command = local.destroy_command
  }
 
   provisioner "local-exec" {
    when    = destroy
    command = self.triggers.destroy_command
  }
  

}