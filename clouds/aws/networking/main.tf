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

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = merge(var.tags, { Name = var.vpc_name })
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.vpc_name}-igw" })
}

# Subnets
resource "aws_subnet" "main" {
  count                   = length(var.subnet_names)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = count.index == 0 ? true : false
  
  tags = merge(var.tags, { 
    Name = var.subnet_names[count.index]
    Type = count.index == 0 ? "Application" : "Database"
  })
}

# Route Table for Application Subnet
resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(var.tags, { Name = "${var.vpc_name}-app-rt" })
}

# Route Table Association for Application Subnet
resource "aws_route_table_association" "app" {
  subnet_id      = aws_subnet.main[0].id
  route_table_id = aws_route_table.app.id
}

# Security Group for Application Subnet
resource "aws_security_group" "app" {
  name        = "${var.vpc_name}-app-sg"
  description = "Security group for application instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_source_cidr]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.vpc_name}-app-sg" })
}
