# AWS Compute Outputs

output "resource_ids" {
  description = "Map of resource names to IDs"
  value = {
    instances = aws_instance.main[*].id
  }
}

output "network_id" {
  description = "No network in compute module"
  value       = null
}

output "subnet_ids" {
  description = "No subnets in compute module"
  value       = []
}

output "instance_ids" {
  description = "IDs of all EC2 instances"
  value       = aws_instance.main[*].id
}

output "instance_public_ips" {
  description = "Public IP addresses of all EC2 instances"
  value       = aws_instance.main[*].public_ip
}

output "instance_private_ips" {
  description = "Private IP addresses of all EC2 instances"
  value       = aws_instance.main[*].private_ip
}

# Legacy outputs for backward compatibility
output "instance_names" {
  description = "Names of all EC2 instances"
  value       = aws_instance.main[*].tags["Name"]
}

output "instance_private_ips" {
  description = "Private IP addresses of all EC2 instances"
  value       = aws_instance.main[*].private_ip
}

output "instance_public_ips" {
  description = "Public IP addresses of all EC2 instances"
  value       = aws_instance.main[*].public_ip
}

output "instance_availability_zones" {
  description = "Availability zones of all EC2 instances"
  value       = aws_instance.main[*].availability_zone
}
