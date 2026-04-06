# AWS Networking Module

Creates AWS VPC, subnets, and security groups equivalent to Azure implementation.

## Resources

- VPC (Virtual Private Cloud)
- Subnets (Application, Database)
- Internet Gateway
- Route Tables
- Security Groups

## Usage

```hcl
module "aws_networking" {
  source = "./clouds/aws/networking"
  
  region           = var.region
  vpc_cidr         = var.vpc_cidr
  vpc_name         = var.vpc_name
  
  subnet_names     = var.subnet_names
  subnet_cidrs     = var.subnet_cidrs
  
  ssh_source_cidr  = var.ssh_source_cidr
  tags             = var.tags
}
```
