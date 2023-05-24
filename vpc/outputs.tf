/************************* 
Outputs for main VPC 
*************************/

output "main_azs" {
  description = "A list of availability zones specified as argument to this module"
  value       = module.vpc_main.azs
}

output "main_name" {
  description = "The name of the VPC specified as argument to this module"
  value       = module.vpc_main.name
}

output "main_vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_main.vpc_id
}

output "main_vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc_main.vpc_cidr_block
}

output "main_vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.vpc_main.vpc_enable_dns_support
}

output "main_vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.vpc_main.vpc_enable_dns_hostnames
}

output "main_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc_main.private_subnets
}

output "main_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc_main.public_subnets
}

output "main_nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc_main.nat_ids
}

output "main_igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc_main.igw_id
}
