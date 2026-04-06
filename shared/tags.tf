# Shared Tags and Labels for Multi-Cloud Infrastructure

locals {
  # Standard tags/labels for all clouds
  standard_tags = merge(
    {
      # Common tags across all clouds
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner_email
      CostCenter  = var.cost_center
      ManagedBy   = "terraform"
    },
    var.tags
  )
  
  # Cloud-specific tag formats
  azure_tags = local.standard_tags
  
  aws_tags = local.standard_tags
  
  gcp_labels = {
    for key, value in local.standard_tags :
    lower(key) => value  # GCP labels must be lowercase
  }
  
  # Environment-specific configurations
  env_config = {
    dev = {
      instance_count = 1
      instance_size  = "small"
      cost_class     = "development"
    }
    staging = {
      instance_count = 2
      instance_size  = "medium"
      cost_class     = "staging"
    }
    prod = {
      instance_count = 3
      instance_size  = "large"
      cost_class     = "production"
    }
  }
  
  # Current environment configuration
  current_env = local.env_config[var.environment]
}
