# GCP Compute Outputs

output "instance_ids" {
  description = "IDs of all compute instances"
  value       = google_compute_instance.main[*].id
}

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
