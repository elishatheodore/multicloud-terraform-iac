# Azure Complete Example Variables

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
  default     = "azinfra-rg"
}

variable "location" {
  type        = string
  description = "Azure region for deployment"
  default     = "East US"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "azinfra-vnet"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_names" {
  type        = list(string)
  description = "Names of the subnets to create"
  default     = ["azinfra-subnet", "azinfra-db-subnet"]
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "Address prefixes for subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vm_count" {
  type        = number
  description = "Number of virtual machines to create"
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machines"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the virtual machines"
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key file"
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_source_cidr" {
  type        = string
  description = "Source CIDR for SSH access"
  default     = "10.0.0.0/8"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {
    Environment = "dev"
    Project     = "azinfra"
  }
}
