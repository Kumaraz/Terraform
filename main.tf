# Provider Details
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
}

# Configure the AWS provide
provider "aws" {
  region = "ap-south-1"
}

# VPC Resource - vpc main
resource "aws_vpc" "main" {
    cidr_block = "10.10.0.0/16"
    
    tags = {
        Name = "main"
    }
}
# Subnet - web subnet
resource "aws_subnet" "websubnet" {

    cidr_block = "10.10.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      "Name" = "main-web"
    }
    vpc_id = aws_vpc.main.id
}

# Subnet - app subnet
resource "aws_subnet" "appsubnet" {

    cidr_block = "10.10.1.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      "Name" = "main-app"
    }
    vpc_id = aws_vpc.main.id
}

# Subnet - db subnet
resource "aws_subnet" "dbsubnet" {

    cidr_block = "10.10.2.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      "Name" = "main-db"
    }
    vpc_id = aws_vpc.main.id
}