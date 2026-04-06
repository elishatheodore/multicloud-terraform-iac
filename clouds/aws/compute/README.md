# AWS Compute Module

Creates AWS EC2 instances equivalent to Azure VMs.

## Resources

- EC2 Instances
- Key Pairs
- Security Groups
- Elastic IPs (optional)

## Usage

```hcl
module "aws_compute" {
  source = "./clouds/aws/compute"
  
  region             = var.region
  
  instance_count     = var.instance_count
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  key_name           = var.key_name
  
  subnet_id          = module.aws_networking.application_subnet_id
  security_group_id  = module.aws_networking.security_group_id
  
  tags               = var.tags
}
```
