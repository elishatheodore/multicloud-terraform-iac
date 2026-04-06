# AWS Networking Outputs

output "resource_ids" {
  description = "Map of resource names to IDs"
  value = {
    vpc              = aws_vpc.main.id
    internet_gateway = aws_internet_gateway.main.id
    security_group   = aws_security_group.app.id
    subnets          = aws_subnet.main[*].id
  }
}

output "network_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "IDs of all subnets"
  value       = aws_subnet.main[*].id
}

output "instance_ids" {
  description = "No instances in networking module"
  value       = []
}

output "instance_public_ips" {
  description = "No public IPs in networking module"
  value       = []
}

output "instance_private_ips" {
  description = "No private IPs in networking module"
  value       = []
}

# Legacy outputs for backward compatibility
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "subnet_names" {
  description = "Names of all subnets"
  value       = aws_subnet.main[*].tags["Name"]
}

output "application_subnet_id" {
  description = "ID of the application subnet (first subnet)"
  value       = aws_subnet.main[0].id
}

output "database_subnet_id" {
  description = "ID of the database subnet (second subnet)"
  value       = length(aws_subnet.main) > 1 ? aws_subnet.main[1].id : null
}

output "security_group_id" {
  description = "ID of the application security group"
  value       = aws_security_group.app.id
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = aws_internet_gateway.main.id
}
