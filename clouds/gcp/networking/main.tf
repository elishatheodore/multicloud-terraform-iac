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
}

# VPC Network
resource "google_compute_network" "main" {
  name                    = var.network_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  labels                  = var.labels
}

# Subnets
resource "google_compute_subnetwork" "main" {
  count                     = length(var.subnet_names)
  name                      = var.subnet_names[count.index]
  ip_cidr_range             = var.subnet_cidrs[count.index]
  region                    = var.region
  network                   = google_compute_network.main.id
  private_ip_google_access  = true
  
  labels = merge(var.labels, { 
    type = count.index == 0 ? "application" : "database"
  })
}

# Firewall Rule for SSH
resource "google_compute_firewall" "ssh" {
  name    = "${var.network_name}-allow-ssh"
  network = google_compute_network.main.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.ssh_source_cidr]
  target_tags   = ["application"]
  labels        = var.labels
}

# Firewall Rule for Egress
resource "google_compute_firewall" "egress" {
  name      = "${var.network_name}-allow-egress"
  network   = google_compute_network.main.id
  direction = "EGRESS"

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
  target_tags        = ["application"]
  labels             = var.labels
}
