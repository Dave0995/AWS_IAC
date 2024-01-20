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
  
  environment = var.environment

  # VPC
  vpc_cidr_block = var.vpc_cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_tag_name = var.vpc_tag_name

  # Public subnet
  public_subnet_cidr_block_1 = var.public_subnet_cidr_block_1
  public_availability_zone_1 = var.public_availability_zone_1
  public_map_public_ip_1 = var.public_map_public_ip_1
  public_subnet_tag_name_1 = var.public_subnet_tag_name_1

  public_subnet_cidr_block_2 = var.public_subnet_cidr_block_2
  public_availability_zone_2 = var.public_availability_zone_2
  public_map_public_ip_2 = var.public_map_public_ip_2
  public_subnet_tag_name_2 = var.public_subnet_tag_name_2

  # Private subnet
  private_subnet_cidr_block_1 = var.private_subnet_cidr_block_1
  private_availability_zone_1 = var.private_availability_zone_1
  private_map_public_ip_1 = var.private_map_public_ip_1
  private_subnet_tag_name_1 = var.private_subnet_tag_name_1

  private_subnet_cidr_block_2 = var.private_subnet_cidr_block_2
  private_availability_zone_2 = var.private_availability_zone_2
  private_map_public_ip_2 = var.private_map_public_ip_2
  private_subnet_tag_name_2 = var.private_subnet_tag_name_2

  internet_gateway_tag = var.internet_gateway_tag
  public_route_table_tag = var.public_route_table_tag
  private_route_table_tag_1 = var.private_route_table_tag_1
  private_route_table_tag_2 = var.private_route_table_tag_2
  aws_security_group_tag = var.aws_security_group_tag
}
module "dave_airflow" {
  source = "../../modules/orchestrator"

  security_group_id = module.dave_network.security_group_id
  s3_airflow_bucket_arn = module.dave_storage.airflow_bucket_name_arn
  private_subnets_id = module.dave_network.private_subnets_id
  environment = var.environment
}

module "dave_ecr" {
  source = "../../modules/artifacts"
  region = var.region
  account_id = var.account_id
  application_id = var.application_id
}