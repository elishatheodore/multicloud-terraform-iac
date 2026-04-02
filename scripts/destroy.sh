#!/bin/bash
# Destroy azinfra

echo "⚠️  Destroying all Azure resources..."
read -p "Type 'yes' to continue: " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
    echo "Aborted."
    exit 1
fi

terraform -chdir=../terraform init
terraform -chdir=../terraform destroy -auto-approve
echo "✅ All resources destroyed."