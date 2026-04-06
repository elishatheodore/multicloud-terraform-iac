# Azure Networking Variables

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
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

variable "ssh_source_cidr" {
  type        = string
  description = "Source CIDR for SSH access"
  default     = "10.0.0.0/8"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {}
}
