# GCP Compute Module

Creates GCP Compute Engine instances equivalent to Azure VMs.

## Resources

- Compute Engine Instances
- Service Accounts
- SSH Keys
- Persistent Disks

## Usage

```hcl
module "gcp_compute" {
  source = "./clouds/gcp/compute"
  
  project_id        = var.project_id
  region            = var.region
  zone              = var.zone
  
  instance_count    = var.instance_count
  machine_type      = var.machine_type
  image_family      = var.image_family
  
  subnet_id         = module.gcp_networking.application_subnet_id
  
  tags              = var.tags
  labels            = var.labels
}
```
