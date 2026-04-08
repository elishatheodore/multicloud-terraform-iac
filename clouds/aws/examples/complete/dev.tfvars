# Development Environment Configuration
region = "us-east-1"

vpc_name = "aws-vpc-dev"
vpc_cidr = "10.0.0.0/16"

subnet_names = ["aws-subnet-dev", "aws-db-subnet-dev"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

instance_count = 1
instance_type  = "t2.micro"
key_name       = "my-key-pair"

ssh_source_cidr = "10.0.0.0/8"

tags = {
  Environment = "dev"
  Project     = "cloudinfra"
  Owner       = "devops-team"
  CostCenter  = "engineering"
}
