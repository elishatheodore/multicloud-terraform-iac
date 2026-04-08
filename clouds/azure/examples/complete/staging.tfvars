# Staging Environment Configuration
resource_group_name = "azure-rg-staging"
location            = "East US"
vnet_name           = "azure-vnet-staging"
vnet_address_space  = ["10.0.0.0/16"]

subnet_names    = ["azure-subnet-staging", "azure-db-subnet-staging"]
subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

vm_count       = 2
vm_size        = "Standard_B2s"
admin_username = "azureuser"

ssh_public_key_path = "~/.ssh/id_rsa.pub"
ssh_source_cidr     = "10.0.0.0/8"

tags = {
  Environment = "staging"
  Project     = "cloudinfra"
  Owner       = "devops-team"
  CostCenter  = "engineering"
}
