# Staging Environment Configuration
project_id = "my-gcp-project"
region     = "us-central1"
zone       = "us-central1-a"

network_name = "gcp-network-staging"
network_cidr = "10.0.0.0/16"

subnet_names = ["gcp-subnet-staging", "gcp-db-subnet-staging"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

instance_count = 2
machine_type   = "e2-small"

ssh_source_cidr = "10.0.0.0/8"

labels = {
  environment = "staging"
  project     = "cloudinfra"
  owner       = "devops-team"
  cost_center = "engineering"
}
