# AWS Compute Outputs

output "instance_ids" {
  description = "IDs of all EC2 instances"
  value       = aws_instance.main[*].id
}

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
