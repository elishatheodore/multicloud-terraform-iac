# AWS Complete Example Outputs

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "subnet_ids" {
  description = "IDs of all subnets"
  value       = module.networking.subnet_ids
}

output "security_group_id" {
  description = "ID of the application security group"
  value       = module.networking.security_group_id
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = module.networking.internet_gateway_id
}

output "instance_ids" {
  description = "IDs of all EC2 instances"
  value       = module.compute.instance_ids
}

output "instance_private_ips" {
  description = "Private IP addresses of all EC2 instances"
  value       = module.compute.instance_private_ips
}

output "instance_public_ips" {
  description = "Public IP addresses of all EC2 instances"
  value       = module.compute.instance_public_ips
}

output "instance_names" {
  description = "Names of all EC2 instances"
  value       = module.compute.instance_names
}
