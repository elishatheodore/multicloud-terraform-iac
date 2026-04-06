# Resource Group
variable "resource_group_name" {
  type    = string
  default = "azinfra-rg"
}

variable "location" {
  type    = string
  default = "East US"
}

# Virtual Network
variable "vnet_name" {
  type    = string
  default = "azinfra-vnet"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

# Subnets
variable "subnet_names" {
  type    = list(string)
  default = ["azinfra-subnet", "azinfra-db-subnet"]
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Linux VMs
variable "vm_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

# SSH Access
variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_source_cidr" {
  type        = string
  default     = "10.0.0.0/8"
  description = "Source CIDR for SSH access; use a limited range in production."
}