# Development Environment Configuration
resource_group_name = "azure-rg-dev"
location            = "East US"
vnet_name           = "azure-vnet-dev"
vnet_address_space  = ["10.0.0.0/16"]

subnet_names    = ["azure-subnet-dev", "azure-db-subnet-dev"]
subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

vm_count       = 1
vm_size        = "Standard_B1s"
admin_username = "azureuser"

ssh_public_key_path = "~/.ssh/id_rsa.pub"
ssh_source_cidr     = "10.0.0.0/8"

tags = {
  Environment = "dev"
  Project     = "cloudinfra"
  Owner       = "devops-team"
  CostCenter  = "engineering"
}
