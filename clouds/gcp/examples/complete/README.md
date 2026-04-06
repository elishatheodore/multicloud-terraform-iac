# GCP Complete Example

This example demonstrates a complete GCP deployment using all modules.

## Architecture

- VPC Network with Application and Database subnets
- Firewall rules for SSH access
- Compute Engine instances in Application subnet

## Usage

```bash
cd clouds/gcp/examples/complete
terraform init
terraform plan
terraform apply
```

## Variables

Create a `terraform.tfvars` file:

```hcl
project_id = "my-gcp-project"
region     = "us-central1"
zone       = "us-central1-a"

network_name = "azinfra-network"
network_cidr = "10.0.0.0/16"

subnet_names = ["azinfra-subnet", "azinfra-db-subnet"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

instance_count = 2
machine_type   = "e2-micro"

ssh_source_cidr = "10.0.0.0/8"

labels = {
  environment = "dev"
  project     = "azinfra"
}
```

## Prerequisites

1. Ensure you have the necessary GCP permissions
2. Set up GCP authentication (service account key or gcloud auth)

## Outputs

- VPC network details
- Subnet information
- Compute Engine instance details
