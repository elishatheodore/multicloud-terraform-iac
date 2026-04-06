# GCP Networking Outputs

output "resource_ids" {
  description = "Map of resource names to IDs"
  value = {
    network   = google_compute_network.main.id
    firewall  = google_compute_firewall.ssh.id
    subnets   = google_compute_subnetwork.main[*].id
  }
}

output "network_id" {
  description = "ID of the VPC network"
  value       = google_compute_network.main.id
}

output "subnet_ids" {
  description = "IDs of all subnets"
  value       = google_compute_subnetwork.main[*].id
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
output "network_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.main.name
}

output "subnet_names" {
  description = "Names of all subnets"
  value       = google_compute_subnetwork.main[*].name
}

output "application_subnet_id" {
  description = "ID of the application subnet (first subnet)"
  value       = google_compute_subnetwork.main[0].id
}

output "database_subnet_id" {
  description = "ID of the database subnet (second subnet)"
  value       = length(google_compute_subnetwork.main) > 1 ? google_compute_subnetwork.main[1].id : null
}

output "firewall_ssh_id" {
  description = "ID of the SSH firewall rule"
  value       = google_compute_firewall.ssh.id
}
