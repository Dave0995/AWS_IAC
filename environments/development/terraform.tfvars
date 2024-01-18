# Setup variables
region = "us-east-1"
environment = "d"

# VPC
vpc_cidr_block = "10.192.0.0/16"
enable_dns_support = true
enable_dns_hostnames = true
vpc_tag_name = "dave-vpc"

# Public subnet
public_subnet_cidr_block_1 = "10.192.10.0/24"
public_availability_zone_1 = "us-east-1a"
public_map_public_ip_1 = true
public_subnet_tag_name_1 = "dave-public-subnet-1"

public_subnet_cidr_block_2 = "10.192.11.0/24"
public_availability_zone_2 = "us-east-1b"
public_map_public_ip_2 = true
public_subnet_tag_name_2 = "dave-public-subnet-2"

# Private subnet
private_subnet_cidr_block_1 = "10.192.20.0/24"
private_availability_zone_1 = "us-east-1a"
private_map_public_ip_1 = false
private_subnet_tag_name_1 = "dave-private-subnet-1"

private_subnet_cidr_block_2 = "10.192.21.0/24"
private_availability_zone_2 = "us-east-1b"
private_map_public_ip_2 = false
private_subnet_tag_name_2 = "dave-private-subnet-2"

internet_gateway_tag = "dave-igw"
public_route_table_tag = "dave-route-table"
aws_security_group_tag = "dave-security-group"