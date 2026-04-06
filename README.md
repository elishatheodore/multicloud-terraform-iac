# Multi-Cloud Infrastructure as Code

A comprehensive, cloud-agnostic Infrastructure as Code project supporting **Azure, AWS, and GCP** with modular design and CI/CD automation.

## 🌐 Overview

This project transforms a single Azure infrastructure into a multi-cloud solution with:
- **Modular Architecture** - Reusable components for networking, compute, storage, and security
- **Cloud Abstraction** - Consistent interfaces across Azure, AWS, and GCP
- **CI/CD Automation** - Ready-to-deploy GitHub Actions workflows
- **Parameterization** - All values configurable with sensible defaults

## 🏗️ Architecture

```
Multi-Cloud Infrastructure
├── Azure (azinfra)
│   ├── Resource Group → VPC → Subnets
│   ├── Network Security Group → Security Groups
│   └── Linux VMs → EC2 Instances → Compute Engine
├── AWS (azinfra)
│   ├── VPC → VPC Network
│   ├── Subnets → Subnetworks
│   └── EC2 → Compute Engine
└── GCP (azinfra)
    ├── VPC Network → VNet
    ├── Subnetworks → Subnets
    └── Compute Engine → VMs
```

## � Project Structure

```
azure-infrastructure/
├── clouds/                          # Multi-cloud implementations
│   ├── azure/                       # Azure modules
│   │   ├── networking/              # VNet, subnets, NSG
│   │   ├── compute/                 # VMs, NICs
│   │   └── examples/complete/       # Full deployment example
│   ├── aws/                         # AWS modules
│   │   ├── networking/              # VPC, subnets, SG
│   │   ├── compute/                 # EC2 instances
│   │   └── examples/complete/       # Full deployment example
│   └── gcp/                         # GCP modules
│       ├── networking/              # VPC, subnets, firewall
│       ├── compute/                 # Compute Engine
│       └── examples/complete/       # Full deployment example
├── .github/workflows/               # CI/CD pipelines
│   ├── deploy-azure.yml            # Azure deployment
│   ├── deploy-aws.yml              # AWS deployment
│   └── deploy-gcp.yml              # GCP deployment
├── scripts/                         # Utility scripts
├── azure_project_showcase/          # Original Azure project (preserved)
└── README.md
```

## 🚀 Quick Start

### Prerequisites

**Azure:**
- Azure CLI installed and configured (`az login`)
- Terraform >= 1.3.0
- SSH key pair

**AWS:**
- AWS CLI installed and configured
- EC2 Key Pair created
- Terraform >= 1.3.0

**GCP:**
- gcloud CLI installed and configured
- Service account with appropriate permissions
- Terraform >= 1.3.0

### Deploy to Azure

```bash
cd clouds/azure/examples/complete
terraform init
terraform plan
terraform apply
```

### Deploy to AWS

```bash
cd clouds/aws/examples/complete
terraform init
terraform plan
terraform apply
```

### Deploy to GCP

```bash
cd clouds/gcp/examples/complete
terraform init
terraform plan
terraform apply
```

## 🔧 Configuration

Each cloud provider uses the same modular structure with cloud-specific variables:

### Common Variables
- Network CIDR blocks and subnets
- Instance count and types
- SSH access configuration
- Tags and labels

### Cloud-Specific Variables
- **Azure**: Resource groups, location, VM sizes
- **AWS**: VPC CIDR, instance types, AMI IDs
- **GCP**: Project ID, regions, machine types

## � CI/CD Automation

### GitHub Actions Workflows

Each cloud provider has an automated workflow:

**Triggers:**
- Push to main branch (auto-deploy)
- Pull requests (plan only)
- Manual dispatch (choose environment)

**Environments:**
- `dev` - Development/testing
- `staging` - Pre-production
- `prod` - Production

**Required Secrets:**

**Azure:**
- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_TENANT_ID`

**AWS:**
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_DEFAULT_REGION`

**GCP:**
- `GCP_SA_KEY` (Service Account JSON)
- `GCP_PROJECT_ID`

## 📦 Modules

### Networking Module
Creates network infrastructure:
- **Azure**: VNet, Subnets, NSG, Route Tables
- **AWS**: VPC, Subnets, Internet Gateway, Security Groups
- **GCP**: VPC Network, Subnetworks, Firewall Rules

### Compute Module
Provisions compute resources:
- **Azure**: Linux VMs with SSH, Network Interfaces
- **AWS**: EC2 instances with Key Pairs
- **GCP**: Compute Engine instances with Service Accounts

## �️ Security Features

- **Least Privilege**: Minimal required permissions
- **Network Security**: Configurable SSH access via CIDR
- **Secure Defaults**: No public access unless explicitly configured
- **Encryption**: Managed by cloud providers

## 📊 Outputs

Each deployment provides consistent outputs:
- Network IDs and configurations
- Instance details and IP addresses
- Security group/firewall rule IDs
- Resource names and tags

## 🎯 Use Cases

**Multi-Cloud Strategy:**
- Deploy the same infrastructure across clouds
- Compare cloud-specific implementations
- Disaster recovery and redundancy

**Learning & Development:**
- Understand cloud differences and similarities
- Practice Infrastructure as Code
- Test multi-cloud scenarios

**Production Workloads:**
- Standardized infrastructure patterns
- Automated deployments
- Environment consistency

## 🔍 Cloud Comparison

| Feature | Azure | AWS | GCP |
|---------|-------|-----|-----|
| Network | VNet | VPC | VPC Network |
| Subnet | Subnet | Subnet | Subnetwork |
| Security | NSG | Security Group | Firewall |
| Compute | VM | EC2 | Compute Engine |
| Storage | Disk | EBS | Persistent Disk |
| CLI | az | aws | gcloud |

## 🚀 Next Steps

1. **Customize** modules for your specific requirements
2. **Extend** with additional services (databases, load balancers)
3. **Integrate** with existing CI/CD pipelines
4. **Monitor** with cloud-native monitoring solutions
5. **Scale** with auto-scaling and load balancing

## 📚 Documentation

- [Azure Module Documentation](clouds/azure/README.md)
- [AWS Module Documentation](clouds/aws/README.md)
- [GCP Module Documentation](clouds/gcp/README.md)
- [CI/CD Setup Guide](.github/workflows/README.md)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Add your improvements
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Transform your single-cloud infrastructure into a comprehensive multi-cloud solution!** 🌍
