resource "aws_vpc" "dave_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "${var.vpc_tag_name}-${var.environment}"
  }
}

resource "aws_subnet" "dave_public_subnet" {
  vpc_id                  = aws_vpc.dave_vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.public_availability_zone
  map_public_ip_on_launch = var.public_map_public_ip
  tags = {
    Name = "${var.public_subnet_tag_name}-${var.environment}"
  }
}

resource "aws_subnet" "dave_private_subnet_1" {
  vpc_id                  = aws_vpc.dave_vpc.id
  cidr_block              = var.private_subnet_cidr_block_1
  availability_zone       = var.private_availability_zone_1
  map_public_ip_on_launch = var.private_map_public_ip_1
  tags = {
    Name = "${var.private_subnet_tag_name_1}-${var.environment}"
  }
}

resource "aws_subnet" "dave_private_subnet_2" {
  vpc_id                  = aws_vpc.dave_vpc.id
  cidr_block              = var.private_subnet_cidr_block_2
  availability_zone       = var.private_availability_zone_2
  map_public_ip_on_launch = var.private_map_public_ip_2
  tags = {
    Name = "${var.private_subnet_tag_name_2}-${var.environment}"
  }
}

resource "aws_internet_gateway" "dave_igw" {
  vpc_id = aws_vpc.dave_vpc.id
  tags = {
    Name = "${var.internet_gateway_tag}-${var.environment}"
  }
}

resource "aws_route_table" "dave_public_route_table" {
  vpc_id = aws_vpc.dave_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dave_igw.id
  }
  tags = {
    Name = "${var.public_route_table_tag}-${var.environment}"
  }
}

resource "aws_security_group" "dave_security_group" {
  vpc_id = aws_vpc.dave_vpc.id

  tags = {
    name = "${var.aws_security_group_tag}-${var.environment}"
  }
}

