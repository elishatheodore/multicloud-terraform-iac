# Production Environment Configuration
region = "us-east-1"

vpc_name = "aws-vpc-prod"
vpc_cidr = "10.0.0.0/16"

subnet_names = ["aws-subnet-prod", "aws-db-subnet-prod"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

instance_count = 3
instance_type  = "t2.small"
key_name       = "my-key-pair"

ssh_source_cidr = "10.0.0.0/8"

tags = {
  Environment = "prod"
  Project     = "cloudinfra"
  Owner       = "devops-team"
  CostCenter  = "engineering"
}
