# Azure Infrastructure Portfolio - Quick Start

## 🎯 What This Is

A **multi-cloud Terraform portfolio** showing Azure, AWS, and GCP infrastructure with CI/CD automation.

## 🚀 Quick Deploy

```bash
# Azure
cd clouds/azure/examples/complete
terraform init && terraform apply -var-file=dev.tfvars

# AWS  
cd clouds/aws/examples/complete
terraform init && terraform apply -var-file=dev.tfvars

# GCP
cd clouds/gcp/examples/complete
terraform init && terraform apply -var-file=dev.tfvars
```

## 📁 Key Files

- `clouds/azure/` - Azure modules
- `clouds/aws/` - AWS modules  
- `clouds/gcp/` - GCP modules
- `.github/workflows/` - CI/CD automation
- `README.md` - Full documentation

## 🔄 GitHub Actions

- **Deploy Workflows**: Auto-deploy to dev/staging/prod
- **Security Scan**: tfsec + checkov scanning
- **Drift Detection**: Infrastructure monitoring

## 🛡️ Required Secrets

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
- `GCP_SA_KEY`
- `GCP_PROJECT_ID`

## 💰 Cost Warning

**⚠️ This creates real cloud resources and costs money!**

Development environment: ~$10-25/month per cloud

## 📚 Full Documentation

See the main [README.md](README.md) for complete documentation and examples.

---

**Transform your infrastructure across Azure, AWS, and GCP!** 🌍
