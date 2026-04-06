# Development Environment Configuration
project_id = "my-gcp-project"
region     = "us-central1"
zone       = "us-central1-a"

network_name = "azinfra-network-dev"
network_cidr = "10.0.0.0/16"

subnet_names = ["azinfra-subnet-dev", "azinfra-db-subnet-dev"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

instance_count = 1
machine_type   = "e2-micro"

ssh_source_cidr = "10.0.0.0/8"

labels = {
  environment = "dev"
  project     = "azinfra"
  owner       = "devops-team"
  cost_center = "engineering"
}
