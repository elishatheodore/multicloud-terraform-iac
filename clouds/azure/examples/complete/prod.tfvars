# Production Environment Configuration
resource_group_name = "azinfra-rg-prod"
location            = "East US"
vnet_name           = "azinfra-vnet-prod"
vnet_address_space  = ["10.0.0.0/16"]

subnet_names    = ["azinfra-subnet-prod", "azinfra-db-subnet-prod"]
subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

vm_count       = 3
vm_size        = "Standard_B2s"
admin_username = "azureuser"

ssh_public_key_path = "~/.ssh/id_rsa.pub"
ssh_source_cidr     = "10.0.0.0/8"

tags = {
  Environment = "prod"
  Project     = "azinfra"
  Owner       = "devops-team"
  CostCenter  = "engineering"
}
