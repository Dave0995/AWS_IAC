terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = var.region
}

module "dave_storage" {
    source = "../../modules/storage"
    environment = var.environment
}

module "dave_network" {
  source = "../../modules/network"
  
  # VPC
  vpc_cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  vpc_tag_name = "dave-vpc"

  # subnet cidr block for both private and public
  subnet_cidr_block = "10.0.1.0/24"

  # Public subnet
  public_availability_zone = "us-east-1a"
  public_map_public_ip = true
  public_subnet_tag_name = "dave-public-subnet"

  # Private subnet
  private_availability_zone = "us-east-1b"
  private_map_public_ip = false
  private_subnet_tag_name = "dave-private-subnet"

  internet_gateway_tag = "dave-igw"
  public_route_table_tag = "dave-route-table"

}