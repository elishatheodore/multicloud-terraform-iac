# Azure Networking Outputs

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.main.name
}

output "subnet_ids" {
  description = "IDs of all subnets"
  value       = azurerm_subnet.main[*].id
}

output "subnet_names" {
  description = "Names of all subnets"
  value       = azurerm_subnet.main[*].name
}

output "application_subnet_id" {
  description = "ID of the application subnet (first subnet)"
  value       = azurerm_subnet.main[0].id
}

output "database_subnet_id" {
  description = "ID of the database subnet (second subnet)"
  value       = length(azurerm_subnet.main) > 1 ? azurerm_subnet.main[1].id : null
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = azurerm_network_security_group.vm_nsg.id
}
