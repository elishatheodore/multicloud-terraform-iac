output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "vm_private_ips" {
  value = [for nic in azurerm_network_interface.vm_nic : nic.ip_configuration[0].private_ip_address]
}

output "subnet_names" {
  value = azurerm_subnet.main[*].name
}

output "subnet_ids" {
  value = azurerm_subnet.main[*].id
}

output "vm_ids" {
  value = azurerm_linux_virtual_machine.vm[*].id
}

output "vm_nsg_id" {
  value = azurerm_network_security_group.vm_nsg.id
}