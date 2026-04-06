terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Networking Module
module "networking" {
  source = "../../networking"

  project_id      = var.project_id
  region          = var.region
  
  network_name    = var.network_name
  network_cidr    = var.network_cidr

  subnet_names    = var.subnet_names
  subnet_cidrs    = var.subnet_cidrs

  ssh_source_cidr = var.ssh_source_cidr
  labels          = var.labels
}

# Compute Module
module "compute" {
  source = "../../compute"

  project_id     = var.project_id
  region         = var.region
  zone           = var.zone

  instance_count = var.instance_count
  machine_type   = var.machine_type

  subnet_id      = module.networking.application_subnet_id

  tags           = ["application"]
  labels         = var.labels
}
