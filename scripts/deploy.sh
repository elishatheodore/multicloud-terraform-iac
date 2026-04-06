#!/bin/bash
# Deploy azinfra

ACTION=$1
if [ "$ACTION" != "apply" ]; then
    echo "Usage: ./deploy.sh apply"
    exit 1
fi

echo "⚡ Deploying azinfra infrastructure..."
terraform -chdir=../azure_project_showcase init
terraform -chdir=../azure_project_showcase validate
terraform -chdir=../azure_project_showcase plan -out=tfplan
terraform -chdir=../azure_project_showcase apply tfplan

echo "✅ Deployment complete. VM IPs:"
terraform -chdir=../azure_project_showcase output vm_private_ips