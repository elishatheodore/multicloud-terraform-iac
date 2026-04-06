# AWS Complete Example

This example demonstrates a complete AWS deployment using all modules.

## Architecture

- VPC with Application and Database subnets
- Internet Gateway for public access
- Security Groups with SSH access
- EC2 instances in Application subnet

## Usage

```bash
cd clouds/aws/examples/complete
terraform init
terraform plan
terraform apply
```

## Variables

Create a `terraform.tfvars` file:

```hcl
region = "us-east-1"

vpc_name = "azinfra-vpc"
vpc_cidr = "10.0.0.0/16"

subnet_names = ["azinfra-subnet", "azinfra-db-subnet"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

instance_count = 2
instance_type  = "t2.micro"
key_name       = "my-key-pair"

ssh_source_cidr = "10.0.0.0/8"

tags = {
  Environment = "dev"
  Project     = "azinfra"
}
```

## Prerequisites

1. Create an EC2 Key Pair in the target region
2. Update the `key_name` variable with your key pair name

## Outputs

- VPC and network details
- Subnet information
- EC2 instance details (IDs, IPs)
