terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.region
}

# EC2 Instances
resource "aws_instance" "main" {
  count                       = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(var.tags, { 
    Name = "${var.name_prefix}-ec2-${count.index}"
  })

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }
}
