# Azure Networking Module

Creates Azure Virtual Network, subnets, and network security groups.

## Resources

- Virtual Network (VNet)
- Subnets (Application, Database)
- Network Security Groups
- Route Tables

## Usage

```hcl
module "azure_networking" {
  source = "./clouds/azure/networking"
  
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  
  subnet_names    = var.subnet_names
  subnet_prefixes = var.subnet_prefixes
  
  ssh_source_cidr = var.ssh_source_cidr
  tags            = var.tags
}
```
