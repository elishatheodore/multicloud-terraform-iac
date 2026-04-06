# Shared Locals for Naming Conventions

locals {
  # Generate consistent resource names
  resource_names = {
    # Azure naming conventions
    azure = {
      resource_group = "${var.project_name}-${var.environment}-rg"
      vnet           = "${var.project_name}-${var.environment}-vnet"
      subnet_app     = "${var.project_name}-${var.environment}-subnet-app"
      subnet_db      = "${var.project_name}-${var.environment}-subnet-db"
      nsg            = "${var.project_name}-${var.environment}-nsg"
      vm             = "${var.project_name}-${var.environment}-vm"
    }
    
    # AWS naming conventions
    aws = {
      vpc           = "${var.project_name}-${var.environment}-vpc"
      subnet_app    = "${var.project_name}-${var.environment}-subnet-app"
      subnet_db     = "${var.project_name}-${var.environment}-subnet-db"
      security_group = "${var.project_name}-${var.environment}-sg"
      instance      = "${var.project_name}-${var.environment}-instance"
    }
    
    # GCP naming conventions
    gcp = {
      network   = "${var.project_name}-${var.environment}-network"
      subnet_app = "${var.project_name}-${var.environment}-subnet-app"
      subnet_db  = "${var.project_name}-${var.environment}-subnet-db"
      firewall  = "${var.project_name}-${var.environment}-firewall"
      instance  = "${var.project_name}-${var.environment}-instance"
    }
  }
  
  # Common naming patterns
  common = {
    prefix = "${var.project_name}-${var.environment}"
    suffix = "${var.environment}"
  }
}
