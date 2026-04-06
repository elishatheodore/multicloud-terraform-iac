#!/bin/bash
# Bootstrap AWS Remote State Storage

set -e

# Configuration
BUCKET_NAME="terraform-state-$(date +%s | tail -c 7)"
REGION="us-east-1"
DYNAMODB_TABLE="terraform-locks"

echo "🔧 Creating AWS remote state storage resources..."

# Create S3 bucket
echo "Creating S3 bucket: $BUCKET_NAME"
if [ "$REGION" = "us-east-1" ]; then
  aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$REGION"
else
  aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$REGION" \
    --create-bucket-configuration LocationConstraint="$REGION"
fi

# Enable versioning
echo "Enabling bucket versioning"
aws s3api put-bucket-versioning \
  --bucket "$BUCKET_NAME" \
  --versioning-configuration Status=Enabled

# Enable encryption
echo "Enabling default encryption"
aws s3api put-bucket-encryption \
  --bucket "$BUCKET_NAME" \
  --server-side-encryption-configuration '{
    "Rules": [
      {
        "ApplyServerSideEncryptionByDefault": {
          "SSEAlgorithm": "AES256"
        }
      }
    ]
  }'

# Block public access
echo "Blocking public access"
aws s3api put-public-access-block \
  --bucket "$BUCKET_NAME" \
  --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# Create DynamoDB table for state locking
echo "Creating DynamoDB table: $DYNAMODB_TABLE"
aws dynamodb create-table \
  --table-name "$DYNAMODB_TABLE" \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region "$REGION"

echo ""
echo "✅ AWS remote state storage created successfully!"
echo ""
echo "Add this to your Terraform configuration:"
echo "backend \"s3\" {"
echo "  bucket         = \"$BUCKET_NAME\""
echo "  key            = \"azure-infrastructure/aws/terraform.tfstate\""
echo "  region         = \"$REGION\""
echo "  dynamodb_table = \"$DYNAMODB_TABLE\""
echo "  encrypt        = true"
echo "}"
echo ""
echo "Bucket Name: $BUCKET_NAME"
echo "DynamoDB Table: $DYNAMODB_TABLE"
echo "Region: $REGION"
