# CI/CD Setup Guide

This directory contains GitHub Actions workflows for automated deployment to Azure, AWS, and GCP.

## 🔄 Workflow Overview

### Triggers
- **Push to main**: Automatic deployment
- **Pull Request**: Plan only (no changes applied)
- **Manual Dispatch**: Choose environment and action

### Environments
- `dev` - Development/testing
- `staging` - Pre-production  
- `prod` - Production

## 🔑 Required Secrets

### Azure Secrets
Set these in GitHub repository settings > Secrets and variables > Actions:

```
AZURE_CLIENT_ID=your-service-principal-app-id
AZURE_CLIENT_SECRET=your-service-principal-password
AZURE_SUBSCRIPTION_ID=your-subscription-id
AZURE_TENANT_ID=your-tenant-id
```

**Create Azure Service Principal:**
```bash
az ad sp create-for-rbac --name "github-actions-azinfra" --role="Contributor" --scopes="/subscriptions/<subscription-id>"
```

### AWS Secrets
```
AWS_ACCESS_KEY_ID=your-access-key-id
AWS_SECRET_ACCESS_KEY=your-secret-access-key
AWS_DEFAULT_REGION=us-east-1
```

**Create AWS IAM User:**
1. Go to IAM > Users > Create user
2. Attach `AdministratorAccess` policy (or custom with least privilege)
3. Create access keys

### GCP Secrets
```
GCP_SA_KEY=your-service-account-json-key
GCP_PROJECT_ID=your-project-id
```

**Create GCP Service Account:**
```bash
gcloud iam service-accounts create github-actions
gcloud projects add-iam-policy-binding PROJECT_ID --member="serviceAccount:github-actions@PROJECT_ID.iam.gserviceaccount.com" --role="roles/editor"
gcloud iam service-accounts keys create key.json --iam-account=github-actions@PROJECT_ID.iam.gserviceaccount.com
```

## 🚀 Usage

### Automatic Deployment
Push to main branch:
```bash
git add .
git commit -m "Deploy to all clouds"
git push origin main
```

### Manual Deployment
1. Go to Actions tab in GitHub
2. Select workflow (deploy-azure, deploy-aws, deploy-gcp)
3. Click "Run workflow"
4. Choose environment and parameters

### Pull Request Testing
Create pull request to test changes without deploying:
```bash
git checkout -b feature/new-feature
# Make changes
git add .
git commit -m "Test new feature"
git push origin feature/new-feature
# Create PR on GitHub
```

## 📋 Workflow Steps

### Plan Stage (PRs)
1. Checkout code
2. Setup Terraform
3. Initialize Terraform
4. Validate configuration
5. Generate execution plan
6. Show plan summary

### Apply Stage (Main branch)
1. All plan steps
2. Apply infrastructure changes
3. Display outputs

### Destroy Stage (Manual)
1. Initialize Terraform
2. Destroy all resources

## 🔧 Customization

### Modify Triggers
Edit workflow files to change when deployments run:

```yaml
on:
  push:
    branches: [main, develop]  # Add develop branch
    paths: ['clouds/**']       # Only on cloud changes
  schedule:
    - cron: '0 2 * * 1'       # Weekly Monday 2 AM
```

### Add Environment Variables
Add environment-specific variables in workflow:

```yaml
jobs:
  terraform-apply:
    env:
      TF_VAR_instance_count: 3
      TF_VAR_vm_size: Standard_B2s
```

### Custom Steps
Add custom validation or notification steps:

```yaml
- name: Security Scan
  run: |
    tfsec ./clouds/azure/examples/complete
    
- name: Notify Slack
  uses: 8398a7/action-slack@v3
  with:
    status: ${{ job.status }}
    webhook_url: ${{ secrets.SLACK_WEBHOOK }}
```

## 🛡️ Security Best Practices

1. **Least Privilege**: Use minimal required permissions
2. **Secret Rotation**: Rotate access keys regularly
3. **Branch Protection**: Require PR reviews for main branch
4. **Environment Protection**: Use GitHub environments for approval workflows
5. **Audit Logs**: Monitor deployment activities

## 🔍 Troubleshooting

### Common Issues

**Authentication Failures:**
- Verify secrets are correctly set
- Check service account/ IAM permissions
- Ensure tokens haven't expired

**Terraform Failures:**
- Check provider versions
- Verify variable values
- Review state lock issues

**GitHub Actions Issues:**
- Check workflow syntax
- Verify runner permissions
- Review action versions

### Debugging

Enable debug logging:
```yaml
env:
  TF_LOG: DEBUG
  ACTIONS_STEP_DEBUG: true
```

Check workflow logs:
1. Go to Actions tab
2. Click on workflow run
3. Review each step's output

## 📊 Monitoring

### Deployment Metrics
- Success/failure rates
- Deployment duration
- Resource creation times

### Cost Monitoring
- Set up budget alerts
- Monitor resource usage
- Track deployment costs

### Security Monitoring
- Access log reviews
- Permission audits
- Compliance checks

## 🚀 Advanced Features

### Multi-Region Deployment
Extend workflows to deploy to multiple regions:

```yaml
strategy:
  matrix:
    region: [us-east-1, us-west-2, eu-west-1]
steps:
  - name: Deploy to ${{ matrix.region }}
    run: |
      cd clouds/aws/examples/complete
      terraform apply -var="region=${{ matrix.region }}"
```

### Canary Deployments
Implement gradual rollout strategies:

```yaml
- name: Canary Deployment
  run: |
    # Deploy to 10% of resources
    terraform apply -var="instance_count=1"
    # Wait for validation
    # Deploy remaining resources
    terraform apply -var="instance_count=10"
```

### Rollback Capabilities
Add automatic rollback on failure:

```yaml
- name: Apply Changes
  run: terraform apply -auto-approve
- name: Rollback on Failure
  if: failure()
  run: terraform apply -destroy -auto-approve
```

---

For more information, see the [GitHub Actions documentation](https://docs.github.com/en/actions).
