terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.region
}

# Networking Module
module "networking" {
  source = "../../networking"

  region          = var.region
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr

  subnet_names    = var.subnet_names
  subnet_cidrs    = var.subnet_cidrs

  ssh_source_cidr = var.ssh_source_cidr
  tags            = var.tags
}

# Compute Module
module "compute" {
  source = "../../compute"

  region            = var.region

  instance_count    = var.instance_count
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  key_name          = var.key_name

  subnet_id         = module.networking.application_subnet_id
  security_group_id = module.networking.security_group_id

  tags = var.tags
}
