# Multi-Cloud Infrastructure Modules

This directory contains cloud-specific implementations of the same infrastructure pattern.

## Structure

```
clouds/
├── azure/          # Azure Resource Manager modules
├── aws/            # AWS CloudFormation/Terraform modules  
└── gcp/            # Google Cloud Platform modules
```

Each cloud provider has identical module structure:
- `networking/` - VPC/VNet, subnets, routing
- `compute/` - VMs/instances, scaling
- `storage/` - Disks, databases, object storage
- `security/` - IAM, roles, policies
- `examples/` - Complete deployment examples
