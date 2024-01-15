resource "aws_vpc" "dave_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.vpc_tag_name
  }
}

resource "aws_subnet" "dave_public_subnet" {
  vpc_id                  = aws_vpc.dave_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.public_availability_zone
  map_public_ip_on_launch = var.public_map_public_ip
  tags = {
    Name = var.public_subnet_tag_name
  }
}

resource "aws_subnet" "dave_private_subnet" {
  vpc_id                  = aws_vpc.dave_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.private_availability_zone
  map_public_ip_on_launch = var.private_map_public_ip
  tags = {
    Name = var.private_subnet_tag_name
  }
}

resource "aws_internet_gateway" "dave_igw" {
  vpc_id = aws_vpc.dave_vpc.id
  tags = {
    Name = var.internet_gateway_tag
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "dave_public_route_table" {
  vpc_id = aws_vpc.dave_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dave_igw.id
  }
  tags = {
    Name = var.public_route_table_tag
  }
}

resource "aws_security_group" "dave_security_group" {
  vpc_id = aws_vpc.dave_vpc.id
}

