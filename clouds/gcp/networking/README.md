# GCP Networking Module

Creates GCP VPC network, subnets, and firewall rules equivalent to Azure implementation.

## Resources

- VPC Network
- Subnets (Application, Database)
- Firewall Rules
- Routes

## Usage

```hcl
module "gcp_networking" {
  source = "./clouds/gcp/networking"
  
  project_id       = var.project_id
  region           = var.region
  
  network_name     = var.network_name
  network_cidr     = var.network_cidr
  
  subnet_names     = var.subnet_names
  subnet_cidrs     = var.subnet_cidrs
  
  ssh_source_cidr  = var.ssh_source_cidr
  labels           = var.labels
}
```
