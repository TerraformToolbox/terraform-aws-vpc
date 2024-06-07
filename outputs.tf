output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.main.arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "vpc_default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = aws_vpc.main.default_network_acl_id
}

output "vpc_default_route_table_id" {
  description = "The ID of the default route table"
  value       = aws_vpc.main.default_route_table_id
}

output "vpc_default_security_group_id" {
  description = "The ID of the default security group"
  value       = aws_vpc.main.default_security_group_id
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table"
  value       = aws_vpc.main.main_route_table_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "public_subnet_cidr_blocks" {
  description = "The CIDR blocks of the public subnets"
  value       = aws_subnet.public_subnets[*].cidr_block
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private_subnets[*].id
}

output "private_subnet_cidr_blocks" {
  description = "The CIDR blocks of the private subnets"
  value       = aws_subnet.private_subnets[*].cidr_block
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = length(aws_internet_gateway.igw) > 0 ? aws_internet_gateway.igw[0].id : null
}

output "nat_gateway_ids" {
  description = "The IDs of the NAT Gateways"
  value       = length(aws_nat_gateway.nat) > 0 ? aws_nat_gateway.nat[*].id : []
}

output "nat_gateway_ips" {
  description = "The Elastic IPs of the NAT Gateways"
  value       = length(aws_eip.nat_eip) > 0 ? aws_eip.nat_eip[*].public_ip : []
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = length(aws_route_table.public) > 0 ? aws_route_table.public[0].id : null
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = length(aws_route_table.private) > 0 ? aws_route_table.private[0].id : null
}

output "vpc_endpoints" {
  description = "The IDs of the VPC endpoints"
  value       = aws_vpc_endpoint.endpoints[*].id
}
