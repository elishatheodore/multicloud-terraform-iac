terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"
  
  # Uncomment and configure for remote state backend
  # backend "azurerm" {
  #   resource_group_name  = "terraform-state-rg"
  #   storage_account_name = "terraformstatexxxxx"
  #   container_name       = "tfstate"
  #   key                  = "azure-infrastructure.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Networking Module
module "networking" {
  source = "../../networking"

  name_prefix         = "azure"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space

  subnet_names    = var.subnet_names
  subnet_prefixes = var.subnet_prefixes

  ssh_source_cidr = var.ssh_source_cidr
  tags            = var.tags
}

# Compute Module
module "compute" {
  source = "../../compute"

  name_prefix         = "azure"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vm_count            = var.vm_count
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  ssh_public_key_path = var.ssh_public_key_path

  subnet_id = module.networking.application_subnet_id
  nsg_id    = module.networking.nsg_id

  tags = var.tags
}
