# Azure Compute Outputs

output "resource_ids" {
  description = "Map of resource names to IDs"
  value = {
    vms          = azurerm_linux_virtual_machine.vm[*].id
    network_interfaces = azurerm_network_interface.vm_nic[*].id
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
  description = "IDs of all virtual machines"
  value       = azurerm_linux_virtual_machine.vm[*].id
}

output "instance_public_ips" {
  description = "Public IP addresses of all virtual machines (Azure VMs don't have public IPs by default)"
  value       = []
}

output "instance_private_ips" {
  description = "Private IP addresses of all virtual machines"
  value       = [for nic in azurerm_network_interface.vm_nic : nic.ip_configuration[0].private_ip_address]
}

# Legacy outputs for backward compatibility
output "vm_ids" {
  description = "IDs of all virtual machines"
  value       = azurerm_linux_virtual_machine.vm[*].id
}

output "vm_names" {
  description = "Names of all virtual machines"
  value       = azurerm_linux_virtual_machine.vm[*].name
}

output "vm_private_ips" {
  description = "Private IP addresses of all virtual machines"
  value       = [for nic in azurerm_network_interface.vm_nic : nic.ip_configuration[0].private_ip_address]
}

output "nic_ids" {
  description = "IDs of all network interfaces"
  value       = azurerm_network_interface.vm_nic[*].id
}
