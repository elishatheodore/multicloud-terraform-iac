# Azure Complete Example Outputs

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.main.location
}

# Networking Outputs
output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.networking.vnet_id
}

output "subnet_ids" {
  description = "IDs of all subnets"
  value       = module.networking.subnet_ids
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = module.networking.nsg_id
}

# Compute Outputs
output "vm_ids" {
  description = "IDs of all virtual machines"
  value       = module.compute.vm_ids
}

output "vm_private_ips" {
  description = "Private IP addresses of all virtual machines"
  value       = module.compute.vm_private_ips
}

output "vm_names" {
  description = "Names of all virtual machines"
  value       = module.compute.vm_names
}
