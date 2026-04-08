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

# Compute Engine Instances
resource "google_compute_instance" "main" {
  count        = var.instance_count
  name         = "${var.name_prefix}-vm-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags
  labels       = merge(var.labels, { name = "${var.name_prefix}-vm-${count.index}" })

  boot_disk {
    initialize_params {
      image = "${var.image_project}/${var.image_family}"
      size  = 30
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = var.metadata

  service_account {
    scopes = ["cloud-platform"]
  }
}
