# GCP Compute Outputs

output "resource_ids" {
  description = "Map of resource names to IDs"
  value = {
    instances = google_compute_instance.main[*].id
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
  description = "IDs of all compute instances"
  value       = google_compute_instance.main[*].id
}

output "instance_public_ips" {
  description = "Public IP addresses of all compute instances"
  value       = google_compute_instance.main[*].network_interface[0].access_config[0].nat_ip
}

output "instance_private_ips" {
  description = "Private IP addresses of all compute instances"
  value       = google_compute_instance.main[*].network_interface[0].network_ip
}

# Legacy outputs for backward compatibility
output "instance_names" {
  description = "Names of all compute instances"
  value       = google_compute_instance.main[*].name
}

output "instance_private_ips" {
  description = "Private IP addresses of all compute instances"
  value       = google_compute_instance.main[*].network_interface[0].network_ip
}

output "instance_public_ips" {
  description = "Public IP addresses of all compute instances"
  value       = google_compute_instance.main[*].network_interface[0].access_config[0].nat_ip
}

output "instance_zones" {
  description = "Zones of all compute instances"
  value       = google_compute_instance.main[*].zone
}
