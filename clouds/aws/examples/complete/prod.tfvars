# Production Environment Configuration
region = "us-east-1"

vpc_name = "azinfra-vpc-prod"
vpc_cidr = "10.0.0.0/16"

subnet_names = ["azinfra-subnet-prod", "azinfra-db-subnet-prod"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

instance_count = 3
instance_type  = "t3.medium"
key_name       = "my-key-pair"

ssh_source_cidr = "10.0.0.0/8"

tags = {
  Environment = "prod"
  Project     = "azinfra"
  Owner       = "devops-team"
  CostCenter  = "engineering"
}
