# GCP Compute Variables

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region for deployment"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "GCP zone for deployment"
  default     = "us-central1-a"
}

variable "instance_count" {
  type        = number
  description = "Number of compute instances to create"
  default     = 2
}

variable "machine_type" {
  type        = string
  description = "Machine type for compute instances"
  default     = "e2-micro"
}

variable "image_family" {
  type        = string
  description = "Image family for compute instances"
  default     = "ubuntu-2204-lts"
}

variable "image_project" {
  type        = string
  description = "Project containing the image"
  default     = "ubuntu-os-cloud"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to place instances in"
}

variable "tags" {
  type        = list(string)
  description = "Network tags for instances"
  default     = ["application"]
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply to all resources"
  default     = {}
}

variable "metadata" {
  type        = map(string)
  description = "Metadata to apply to instances"
  default     = {}
}
