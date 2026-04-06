# GCP Complete Example Outputs

output "network_id" {
  description = "ID of the VPC network"
  value       = module.networking.network_id
}

output "subnet_ids" {
  description = "IDs of all subnets"
  value       = module.networking.subnet_ids
}

output "firewall_ssh_id" {
  description = "ID of the SSH firewall rule"
  value       = module.networking.firewall_ssh_id
}

output "instance_ids" {
  description = "IDs of all compute instances"
  value       = module.compute.instance_ids
}

output "instance_private_ips" {
  description = "Private IP addresses of all compute instances"
  value       = module.compute.instance_private_ips
}

output "instance_public_ips" {
  description = "Public IP addresses of all compute instances"
  value       = module.compute.instance_public_ips
}

output "instance_names" {
  description = "Names of all compute instances"
  value       = module.compute.instance_names
}
