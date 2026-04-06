# Azure Compute Outputs

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
