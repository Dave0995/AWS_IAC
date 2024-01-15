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
  vpc_cidr_block = var.vpc_cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_tag_name = var.vpc_tag_name

  # Public subnet
  public_subnet_cidr_block = var.public_subnet_cidr_block
  public_availability_zone = var.public_availability_zone
  public_map_public_ip = var.public_map_public_ip
  public_subnet_tag_name = var.public_subnet_tag_name

  # Private subnet
  private_subnet_cidr_block = var.private_subnet_cidr_block
  private_availability_zone = var.private_availability_zone
  private_map_public_ip = var.private_map_public_ip
  private_subnet_tag_name = var.private_subnet_tag_name

  internet_gateway_tag = var.internet_gateway_tag
  public_route_table_tag = var.public_route_table_tag
}
