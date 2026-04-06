# AWS Networking Variables

variable "region" {
  type        = string
  description = "AWS region for deployment"
  default     = "us-east-1"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "azinfra-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_names" {
  type        = list(string)
  description = "Names of the subnets to create"
  default     = ["azinfra-subnet", "azinfra-db-subnet"]
}

variable "subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for subnets"
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

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for subnets"
  default     = ["us-east-1a", "us-east-1b"]
}
