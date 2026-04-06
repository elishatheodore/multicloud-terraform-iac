# AWS Networking Outputs

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "subnet_ids" {
  description = "IDs of all subnets"
  value       = aws_subnet.main[*].id
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
