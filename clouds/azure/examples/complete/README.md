# Azure Complete Example

This example demonstrates a complete Azure deployment using all modules.

## Architecture

- Resource Group for logical organization
- Virtual Network with Application and Database subnets
- Network Security Group with SSH access
- Linux Virtual Machines in Application subnet

## Usage

```bash
cd clouds/azure/examples/complete
terraform init
terraform plan
terraform apply
```

## Variables

Create a `terraform.tfvars` file:

```hcl
resource_group_name = "azinfra-rg"
location            = "East US"
vnet_name           = "azinfra-vnet"
vnet_address_space  = ["10.0.0.0/16"]

subnet_names    = ["azinfra-subnet", "azinfra-db-subnet"]
subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

vm_count       = 2
vm_size        = "Standard_B1s"
admin_username = "azureuser"

ssh_public_key_path = "~/.ssh/id_rsa.pub"
ssh_source_cidr     = "10.0.0.0/8"

tags = {
  Environment = "dev"
  Project     = "azinfra"
}
```

## Outputs

- Resource group information
- Network details (VNet, subnets, NSG)
- Compute details (VMs, IPs, NICs)
