# Static values (arguments)
output "azs" {
  description = "A list of availability zones specified as argument to this module"
  value       = var.azs
}

output "name" {
  description = "The name of the VPC specified as argument to this module"
  value       = var.name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.this.*.id, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.this.*.cidr_block, [""])[0]
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = concat(aws_vpc.this.*.enable_dns_support, [""])[0]
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = concat(aws_vpc.this.*.enable_dns_hostnames, [""])[0]
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.nat.*.id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = concat(aws_internet_gateway.this.*.id, [""])[0]
}


##### database output ############

output "database_subnets" {

  description = "List of IDs of database subnets"

  value       = aws_subnet.database.*.id

}



output "database_subnet_arns" {

  description = "List of ARNs of database subnets"

  value       = aws_subnet.database.*.arn

}



output "database_subnets_cidr_blocks" {

  description = "List of cidr_blocks of database subnets"

  value       = aws_subnet.database.*.cidr_block

}



output "database_subnets_ipv6_cidr_blocks" {

  description = "List of IPv6 cidr_blocks of database subnets in an IPv6 enabled VPC"

  value       = aws_subnet.database.*.ipv6_cidr_block

}



output "database_subnet_group" {

  description = "ID of database subnet group"

  value       = concat(aws_db_subnet_group.database.*.id, [""])[0]

}



output "database_subnet_group_name" {

  description = "Name of database subnet group"

  value       = concat(aws_db_subnet_group.database.*.name, [""])[0]

}



output "database_route_table_ids" {

  description = "List of IDs of database route tables"

  value       = length(aws_route_table.database.*.id) > 0 ? aws_route_table.database.*.id : aws_route_table.private.*.id

}



output "database_internet_gateway_route_id" {

  description = "ID of the database internet gateway route."

  value       = concat(aws_route.database_internet_gateway.*.id, [""])[0]

}



output "database_nat_gateway_route_ids" {

  description = "List of IDs of the database nat gateway route."

  value       = aws_route.database_nat_gateway.*.id

}



output "database_ipv6_egress_route_id" {

  description = "ID of the database IPv6 egress route."

  value       = concat(aws_route.database_ipv6_egress.*.id, [""])[0]

}



output "database_route_table_association_ids" {

  description = "List of IDs of the database route table association"

  value       = aws_route_table_association.database.*.id

}



output "database_network_acl_id" {

  description = "ID of the database network ACL"

  value       = concat(aws_network_acl.database.*.id, [""])[0]

}



output "database_network_acl_arn" {

  description = "ARN of the database network ACL"

  value       = concat(aws_network_acl.database.*.arn, [""])[0]

}


