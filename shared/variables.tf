# Shared Variables for Multi-Cloud Infrastructure

variable "project_name" {
  type        = string
  description = "Base name for all resources"
  default     = "cloudinfra"
}

variable "environment" {
  type        = string
  description = "Environment (dev, staging, prod)"
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "owner_email" {
  type        = string
  description = "Email of the resource owner"
  default     = "devops-team@example.com"
}

variable "cost_center" {
  type        = string
  description = "Cost center for billing"
  default     = "engineering"
}

variable "region" {
  type        = string
  description = "Primary region for deployment"
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to all resources"
  default     = {}
}
