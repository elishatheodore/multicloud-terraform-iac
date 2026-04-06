#!/bin/bash
# Bootstrap GCP Remote State Storage

set -e

# Configuration
PROJECT_ID=$(gcloud config get-value project 2>/dev/null || echo "")
BUCKET_NAME="terraform-state-$(date +%s | tail -c 7)"
LOCATION="US"

if [ -z "$PROJECT_ID" ]; then
  echo "❌ Error: No GCP project configured. Run: gcloud config set project YOUR_PROJECT_ID"
  exit 1
fi

echo "🔧 Creating GCP remote state storage resources..."
echo "Project ID: $PROJECT_ID"

# Create GCS bucket
echo "Creating GCS bucket: $BUCKET_NAME"
gsutil mb -l "$LOCATION" -p "$PROJECT_ID" "gs://$BUCKET_NAME"

# Enable versioning
echo "Enabling bucket versioning"
gsutil versioning set on "gs://$BUCKET_NAME"

# Enable uniform bucket-level access
echo "Enabling uniform bucket-level access"
gsutil iam ch uniformBucketLevelAccess:enabled "gs://$BUCKET_NAME"

echo ""
echo "✅ GCP remote state storage created successfully!"
echo ""
echo "Add this to your Terraform configuration:"
echo "backend \"gcs\" {"
echo "  bucket = \"$BUCKET_NAME\""
echo "  prefix = \"azure-infrastructure/gcp\""
echo "}"
echo ""
echo "Bucket Name: $BUCKET_NAME"
echo "Project ID: $PROJECT_ID"
echo "Location: $LOCATION"
