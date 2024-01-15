# Setup variables
region = "us-east-1"
environment = "d"

# VPC
vpc_cidr_block = "10.0.0.0/16"
enable_dns_support = true
enable_dns_hostnames = true
vpc_tag_name = "dave-vpc"

# Public subnet
public_subnet_cidr_block = "10.0.1.0/24"
public_availability_zone = "us-east-1a"
public_map_public_ip = true
public_subnet_tag_name = "dave-public-subnet"

# Private subnet
private_subnet_cidr_block_1 = "10.0.2.0/24"
private_availability_zone_1 = "us-east-1b"
private_map_public_ip_1 = false
private_subnet_tag_name_1 = "dave-private-subnet-1"

private_subnet_cidr_block_2 = "10.0.3.0/24"
private_availability_zone_2 = "us-east-1c"
private_map_public_ip_2 = false
private_subnet_tag_name_2 = "dave-private-subnet-2"

internet_gateway_tag = "dave-igw"
public_route_table_tag = "dave-route-table"