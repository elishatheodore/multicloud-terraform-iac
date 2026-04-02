azinfra – Azure Infrastructure Automation 🚀

## 🌐 Overview

`azinfra` provisions a scalable, production-ready Azure environment using Terraform:

- Resource Group
- Virtual Network (VNet)
- Subnets (VM + DB)
- Network Interfaces (NICs)
- Linux VMs with SSH key auth
- Network Security Group (SSH hardened)

## 📐 Architecture

┌───────────────────────────────────────────────┐
│                 VNet (10.0.0.0/16)           │
│  ┌───────────────┐   ┌───────────────┐       │
│  │ VM Subnet     │   │ DB Subnet     │       │
│  │ azinfra-subnet│   │ azinfra-db-   │       │
│  │ 10.0.1.0/24   │   │ subnet        │       │
│  │  - NICs       │   │ 10.0.2.0/24   │       │
│  │  - VMs        │   │  - Reserved   │       │
│  └───────────────┘   └───────────────┘       │
└───────────────────────────────────────────────┘
- `VM Subnet` hosts compute VMs
- `DB Subnet` reserved for database/internal nodes
- `NSG` secures VM subnet (SSH ingress only by default)

## 📁 Folder Structure

- `terraform/`
  - `main.tf`
  - `provider.tf`
  - `variables.tf`
  - `output.tf`
- `scripts/`
  - `deploy.sh`
  - `destroy.sh`
- `docs/` (diagram)
- `README.md`

## ⚡ Prerequisites

- Azure CLI logged in (`az login`)
- Terraform v1.3+
- SSH key pair at `~/.ssh/id_rsa.pub` or custom path

## 🚀 Deploy

```bash
cd terraform
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

Or via scripts:

```bash
cd scripts
./deploy.sh apply
```

## 🧹 Destroy

```bash
cd terraform
terraform destroy
```

Or via script:

```bash
cd scripts
./destroy.sh
```

## 🔧 Customization

Use `terraform.tfvars` or CLI vars:

```hcl
resource_group_name = "azinfra-rg"
location            = "East US"
vm_count            = 2
ssh_source_cidr     = "203.0.113.0/24" # limit in prod
```

## 🔑 SSH Access

- Default key: `~/.ssh/id_rsa.pub`
- Custom key:

```bash
terraform apply -var="ssh_public_key_path=/path/to/public_key.pub"
```

- Connect to VM:

```bash
ssh azureuser@<vm-private-ip>
```

## 📤 Outputs

- `resource_group_name`
- `vm_private_ips`
- `subnet_names`
- `subnet_ids`
- `vm_ids`
- `vm_nsg_id`

## 🎯 Improvements included

- provider constraints in `provider.tf` + required_version
- NSG & association in `main.tf`
- secure SSH ingress control via `ssh_source_cidr`
- helpful README and usage guidance
