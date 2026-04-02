#!/bin/bash
# Deploy azinfra

ACTION=$1
if [ "$ACTION" != "apply" ]; then
    echo "Usage: ./deploy.sh apply"
    exit 1
fi

echo "⚡ Deploying azinfra infrastructure..."
terraform -chdir=../terraform init
terraform -chdir=../terraform validate
terraform -chdir=../terraform plan -out=tfplan
terraform -chdir=../terraform apply tfplan

echo "✅ Deployment complete. VM IPs:"
terraform -chdir=../terraform output vm_private_ips