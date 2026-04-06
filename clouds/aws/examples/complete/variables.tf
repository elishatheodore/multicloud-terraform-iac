# AWS Complete Example Variables

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

variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create"
  default     = 2
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances (Ubuntu 22.04 LTS)"
  default     = "ami-0c02fb55956c7d316" # us-east-1 Ubuntu 22.04 LTS
}

variable "key_name" {
  type        = string
  description = "EC2 Key Pair name for SSH access"
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
