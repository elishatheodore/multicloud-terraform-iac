#!/bin/bash
# Bootstrap Azure Remote State Storage

set -e

# Configuration
RESOURCE_GROUP_NAME="terraform-state-rg"
LOCATION="East US"
STORAGE_ACCOUNT_NAME="terraformstate$(date +%s | tail -c 7)"
CONTAINER_NAME="tfstate"

echo "🔧 Creating Azure remote state storage resources..."

# Create resource group
echo "Creating resource group: $RESOURCE_GROUP_NAME"
az group create \
  --name "$RESOURCE_GROUP_NAME" \
  --location "$LOCATION"

# Create storage account
echo "Creating storage account: $STORAGE_ACCOUNT_NAME"
az storage account create \
  --name "$STORAGE_ACCOUNT_NAME" \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --encryption-services blob

# Get storage account key
STORAGE_KEY=$(az storage account keys list \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --query '[0].value' -o tsv)

# Create blob container
echo "Creating blob container: $CONTAINER_NAME"
az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --account-key "$STORAGE_KEY" \
  --public-access off

echo ""
echo "✅ Azure remote state storage created successfully!"
echo ""
echo "Add this to your Terraform configuration:"
echo "backend \"azurerm\" {"
echo "  resource_group_name  = \"$RESOURCE_GROUP_NAME\""
echo "  storage_account_name = \"$STORAGE_ACCOUNT_NAME\""
echo "  container_name       = \"$CONTAINER_NAME\""
echo "  key                  = \"azure-infrastructure.tfstate\""
echo "}"
echo ""
echo "Storage Account Name: $STORAGE_ACCOUNT_NAME"
echo "Resource Group: $RESOURCE_GROUP_NAME"
