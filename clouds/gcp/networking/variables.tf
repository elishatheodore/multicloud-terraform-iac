# GCP Networking Variables

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
  default     = "gcp"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region for deployment"
  default     = "us-central1"
}

variable "network_name" {
  type        = string
  description = "Name of the VPC network"
  default     = "gcp-network"
}

variable "network_cidr" {
  type        = string
  description = "CIDR range for the VPC network"
  default     = "10.0.0.0/16"
}

variable "subnet_names" {
  type        = list(string)
  description = "Names of the subnets to create"
  default     = ["gcp-subnet", "gcp-db-subnet"]
}

variable "subnet_cidrs" {
  type        = list(string)
  description = "CIDR ranges for subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ssh_source_cidr" {
  type        = string
  description = "Source CIDR for SSH access"
  default     = "10.0.0.0/8"
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply to all resources"
  default     = {}
}
