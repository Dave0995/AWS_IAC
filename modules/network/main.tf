resource "aws_vpc" "dave_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "${var.vpc_tag_name}-${var.environment}"
  }
}

resource "aws_subnet" "dave_public_subnet_1" {
  vpc_id                  = aws_vpc.dave_vpc.id
  cidr_block              = var.public_subnet_cidr_block_1
  availability_zone       = var.public_availability_zone_1
  map_public_ip_on_launch = var.public_map_public_ip_1
  tags = {
    Name = "${var.public_subnet_tag_name_1}-${var.environment}"
  }
}

resource "aws_subnet" "dave_public_subnet_2" {
  vpc_id                  = aws_vpc.dave_vpc.id
  cidr_block              = var.public_subnet_cidr_block_2
  availability_zone       = var.public_availability_zone_2
  map_public_ip_on_launch = var.public_map_public_ip_2
  tags = {
    Name = "${var.public_subnet_tag_name_2}-${var.environment}"
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

resource "aws_route_table" "dave_private_route_table_1" {
  vpc_id = aws_vpc.dave_vpc.id

  tags = {
    Name = "${var.private_route_table_tag_1}-${var.environment}"
  }
}

resource "aws_route_table" "dave_private_route_table_2" {
  vpc_id = aws_vpc.dave_vpc.id

  tags = {
    Name = "${var.private_route_table_tag_2}-${var.environment}"
  }
}

resource "aws_route_table_association" "public_subnet1_association" {
  subnet_id      = aws_subnet.dave_public_subnet_1.id
  route_table_id = aws_route_table.dave_public_route_table.id
}

resource "aws_route_table_association" "public_subnet2_association" {
  subnet_id      = aws_subnet.dave_public_subnet_2.id
  route_table_id = aws_route_table.dave_public_route_table.id
}

resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.dave_private_subnet_1.id
  route_table_id = aws_route_table.dave_private_route_table_1.id
}

resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.dave_private_subnet_2.id
  route_table_id = aws_route_table.dave_private_route_table_2.id
}

resource "aws_eip" "nat_eip_1" {}

resource "aws_eip" "nat_eip_2" {}

resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id        = aws_eip.nat_eip_1.id
  subnet_id            = aws_subnet.dave_public_subnet_1.id
  tags = {
    Name = "nat-gateway_1"
  }
}

resource "aws_nat_gateway" "nat_gateway_2" {
  allocation_id        = aws_eip.nat_eip_2.id
  subnet_id            = aws_subnet.dave_public_subnet_2.id
  tags = {
    Name = "nat-gateway_2"
  }
}

resource "aws_security_group" "dave_security_group" {
  name = "${var.aws_security_group_tag}-${var.environment}"
  vpc_id = aws_vpc.dave_vpc.id

  tags = {
    name = "${var.aws_security_group_tag}-${var.environment}"
  }
}

resource "aws_security_group_rule" "ingress_rule" {
  security_group_id = aws_security_group.dave_security_group.id
  type              = "ingress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_rule" {
  security_group_id = aws_security_group.dave_security_group.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_route" "private_nat_route_1" {
  route_table_id         = aws_route_table.dave_private_route_table_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway_1.id
}

resource "aws_route" "private_nat_route_2" {
  route_table_id         = aws_route_table.dave_private_route_table_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway_2.id
}