# AWS Compute Variables

variable "region" {
  type        = string
  description = "AWS region for deployment"
  default     = "us-east-1"
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

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to place instances in"
}

variable "security_group_id" {
  type        = string
  description = "ID of the security group"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate public IP addresses"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {}
}
