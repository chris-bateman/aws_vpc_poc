# Terraform Training VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc_name
  }
}

# Terraform Training Subnets
resource "aws_subnet" "public-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr["fe1"]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr["fe2"]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-2"
  }
}

resource "aws_subnet" "private-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr["be1"]
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private-1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr["be2"]
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private-2"
  }
}

