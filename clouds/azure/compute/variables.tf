# Azure Compute Variables

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
  default     = "azure"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
}

variable "location" {
  type        = string
  description = "Azure region for deployment"
  default     = "East US"
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

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to place VMs in"
}

variable "nsg_id" {
  type        = string
  description = "ID of the network security group"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {}
}
