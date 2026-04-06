# Multi-Cloud Infrastructure as Code

[![Deploy Azure](https://github.com/elishatheodore/azure-infrastructure/workflows/deploy-azure.yml/badge.svg)](https://github.com/elishatheodore/azure-infrastructure/actions/workflows/deploy-azure.yml)
[![Deploy AWS](https://github.com/elishatheodore/azure-infrastructure/workflows/deploy-aws.yml/badge.svg)](https://github.com/elishatheodore/azure-infrastructure/actions/workflows/deploy-aws.yml)
[![Deploy GCP](https://github.com/elishatheodore/azure-infrastructure/workflows/deploy-gcp.yml/badge.svg)](https://github.com/elishatheodore/azure-infrastructure/actions/workflows/deploy-gcp.yml)
[![Deploy Showcase](https://github.com/elishatheodore/azure-infrastructure/workflows/deploy-showcase.yml/badge.svg)](https://github.com/elishatheodore/azure-infrastructure/actions/workflows/deploy-showcase.yml)
[![Security Scan](https://github.com/elishatheodore/azure-infrastructure/workflows/security-scan.yml/badge.svg)](https://github.com/elishatheodore/azure-infrastructure/actions/workflows/security-scan.yml)

A comprehensive, cloud-agnostic Infrastructure as Code project supporting **Azure, AWS, and GCP** with modular design and enterprise-grade CI/CD automation.

## 🌐 What This Project Demonstrates

- **Multi-Cloud Terraform Modules** - Consistent infrastructure patterns across Azure, AWS, and GCP
- **DRY Module Design** - Reusable networking and compute components
- **Environment-Based Deployments** - dev, staging, and prod with tfvars separation
- **CI/CD Automation** - GitHub Actions workflows with automated and manual control
- **Security Scanning** - Manual tfsec and checkov security analysis
- **Cost Estimation** - Infracost integration for cloud cost visibility
- **Drift Detection** - Scheduled infrastructure monitoring and alerts
- **Code Quality** - Terraform validation and formatting standards
- **Showcase CI/CD** - Complete Azure infrastructure deployment with manual lifecycle management

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

## 📁 Project Structure

```
azure-infrastructure/
├── .github/workflows/               # CI/CD pipelines
│   ├── deploy-azure.yml            # Azure deployment automation
│   ├── deploy-aws.yml              # AWS deployment automation
│   ├── deploy-gcp.yml              # GCP deployment automation
│   ├── deploy-showcase.yml         # Original Azure showcase CI/CD
│   ├── security-scan.yml           # Security scanning workflow
│   ├── drift-detection.yml         # Infrastructure drift monitoring
│   └── validate.yml                 # Terraform validation workflow
├── CHANGELOG.md                     # Version history and release notes
├── CONTRIBUTING.md                   # Contribution guide
├── QUICKSTART.md                     # Quick start guide
├── shared/                         # Common abstractions
│   ├── variables.tf                 # Shared variable definitions
│   ├── locals.tf                   # Naming conventions
│   └── tags.tf                     # Tag/label management
├── scripts/                        # Utility scripts
│   ├── bootstrap-state-azure.sh    # Azure remote state setup
│   ├── bootstrap-state-aws.sh      # AWS remote state setup
│   ├── bootstrap-state-gcp.sh      # GCP remote state setup
│   ├── deploy.sh                   # Original deployment script
│   └── destroy.sh                  # Original destruction script
├── tests/                          # Validation and testing framework
├── clouds/                         # Multi-cloud implementations
│   ├── azure/                       # Azure modules
│   │   ├── networking/              # VNet, subnets, NSG
│   │   ├── compute/                 # VMs, network interfaces
│   │   └── examples/complete/       # Full deployment example
│   ├── aws/                         # AWS modules
│   │   ├── networking/              # VPC, subnets, security groups
│   │   ├── compute/                 # EC2 instances
│   │   └── examples/complete/       # Full deployment example
│   └── gcp/                         # GCP modules
│       ├── networking/              # VPC network, subnetworks, firewall
│       ├── compute/                 # Compute Engine instances
│       └── examples/complete/       # Full deployment example
└── azure_project_showcase/          # Original Azure project with CI/CD
    ├── main.tf                      # Azure resources (RG, VNet, VMs)
    ├── variables.tf                 # Variable definitions
    ├── provider.tf                  # Azure provider
    ├── output.tf                    # Resource outputs
    ├── backend.tf                   # Remote state config
    └── terraform.tfvars.example     # Configuration example
```

## 🚀 Getting Started

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

### Quick Deploy to Azure

```bash
cd clouds/azure/examples/complete
terraform init
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars
```

### Quick Deploy to AWS

```bash
cd clouds/aws/examples/complete
terraform init
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars
```

### Quick Deploy to GCP

```bash
cd clouds/gcp/examples/complete
terraform init
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars
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

## 🔄 CI/CD Automation

### GitHub Actions Workflows

**Automated Workflows:**
- Push to main branch (auto-deploy multi-cloud modules)
- Pull requests (plan only for multi-cloud modules)
- Scheduled drift detection (daily)

**Manual Workflows:**
- Showcase deployment (plan/apply/destroy)
- Security scanning (tfsec + checkov)
- Terraform validation (module testing)

**Environments:**
- `dev` - Development/testing
- `staging` - Pre-production
- `prod` - Production
- `production` - Showcase deployment environment

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

### 🎯 Original Azure Showcase CI/CD

The `azure_project_showcase/` directory includes its own CI/CD workflow (`deploy-showcase.yml`) that demonstrates:

- **Manual Deployment**: Full Azure infrastructure deployment with manual control
- **Complete Lifecycle**: Plan/Apply/Destroy options via workflow dispatch
- **Remote State**: Backend configuration for production use
- **Manual Trigger**: Only runs when manually executed (no auto-triggers)

**Showcase Features:**
- Resource Groups, VNets, Subnets, NSGs
- Linux VMs with SSH access
- Complete lifecycle management
- Production-ready configuration

**How to Use:**
1. Go to GitHub Actions → "Deploy Azure Showcase"
2. Click "Run workflow"
3. Choose action: plan, apply, or destroy
4. Execute manually

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

## 🛡️ Security Features

- **Least Privilege**: Minimal required permissions
- **Network Security**: Configurable SSH access via CIDR
- **Secure Defaults**: No public access unless explicitly configured
- **Encryption**: Managed by cloud providers

## 📊 Cost

**⚠️ Disclaimer**: Deploying this infrastructure creates real cloud resources and will incur costs.

### Estimated Monthly Costs (Development Environment)

| Cloud | Resources | Estimated Cost |
|--------|------------|----------------|
| **Azure** | 1x Standard_B1s VM, VNet, Subnets | ~$15-25/month |
| **AWS** | 1x t2.micro EC2, VPC, Subnets | ~$10-20/month |
| **GCP** | 1x e2-micro VM, VPC, Subnets | ~$8-15/month |

*Costs vary by region and usage. Monitor costs via cloud provider dashboards.*

## 🔍 Running Locally

### Validation Tests

Run the validation suite to test all modules:

```bash
# Clone the repository
git clone https://github.com/elishatheodore/azure-infrastructure
cd azure-infrastructure

# Run validation tests
./tests/validate.sh
```

This will:
- Initialize Terraform in all module directories
- Validate syntax and configuration
- Report pass/fail status for each module

### Local Development

For local development and testing:

```bash
# Run validation tests
./tests/validate.sh

# Format Terraform files
terraform fmt -recursive

# Validate modules
terraform validate
```

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
| State Backend | Azure Storage | S3 + DynamoDB | GCS |

## 📚 Documentation

- [Azure Module Documentation](clouds/azure/README.md)
- [AWS Module Documentation](clouds/aws/README.md)
- [GCP Module Documentation](clouds/gcp/README.md)
- [CI/CD Setup Guide](.github/workflows/README.md)
- [Security Scanning Guide](.github/workflows/security-scan.yml)

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Workflow

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and validation
5. Submit a pull request

### Code Quality Standards

- All `.tf` files must have descriptions on variables and outputs
- Run `terraform fmt` before committing
- Pass `terraform validate` for all modules
- Follow naming conventions in `shared/locals.tf`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏆 Acknowledgments

This project demonstrates enterprise-grade Infrastructure as Code patterns and DevOps best practices for cloud engineering portfolios.

---

**🚀 Transform your single-cloud infrastructure into a comprehensive multi-cloud solution!**
