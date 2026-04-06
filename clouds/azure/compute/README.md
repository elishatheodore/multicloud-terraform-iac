# Azure Compute Module

Creates Azure Linux Virtual Machines with network interfaces.

## Resources

- Network Interfaces
- Linux Virtual Machines
- SSH Key Authentication
- OS Disks

## Usage

```hcl
module "azure_compute" {
  source = "./clouds/azure/compute"
  
  resource_group_name = var.resource_group_name
  location            = var.location
  
  vm_count           = var.vm_count
  vm_size            = var.vm_size
  admin_username     = var.admin_username
  ssh_public_key_path = var.ssh_public_key_path
  
  subnet_id          = module.azure_networking.application_subnet_id
  nsg_id             = module.azure_networking.nsg_id
  
  tags               = var.tags
}
```
