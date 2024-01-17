variable "public_availability_zone_1" {
    type = string
    description = "Availability zone for the public VPC subnet 1"
}

variable "public_route_table_tag" {
    type = string
    description = "Tag name for public route table"
}

variable "public_subnet_cidr_block_1" {
    type = string
    description = "IP range values for public subnet 1"
}

variable "public_map_public_ip_1" {
    type = bool
    description = "Flag for enabling ip public map on public subnet 1"
}

variable "public_availability_zone_2" {
    type = string
    description = "Availability zone for the public VPC subnet 2"
}

variable "public_subnet_cidr_block_2" {
    type = string
    description = "IP range values for public subnet 2"
}

variable "public_map_public_ip_2" {
    type = bool
    description = "Flag for enabling ip public map on public subnet 2"
}

variable "private_availability_zone_1" {
    type = string
    description = "Availability zone for the private VPC subnet 1"
}

variable "private_availability_zone_2" {
    type = string
    description = "Availability zone for the private VPC subnet 2"
}

variable "vpc_tag_name" {
    type = string
    description = "Tag name for the VPC network"
}

variable "public_subnet_tag_name_1" {
    type = string
    description = "Tag name for the public subnet 1"
}

variable "public_subnet_tag_name_2" {
    type = string
    description = "Tag name for the public subnet 2"
}

variable "private_subnet_tag_name_1" {
    type = string
    description = "Tag name for the private subnet 1"
}

variable "private_subnet_tag_name_2" {
    type = string
    description = "Tag name for the private subnet 2"
}

variable "internet_gateway_tag" {
    type = string
    description = "Tag name for the internet gatway"
}

variable "vpc_cidr_block" {
    type = string
    description = "IP range values for vpc"
}

variable "private_subnet_cidr_block_1" {
    type = string
    description = "IP range values for private subnet 1"
}

variable "private_subnet_cidr_block_2" {
    type = string
    description = "IP range values for private subnet 2"
}

variable "enable_dns_support" {
    type = bool
    description = "Flag for adding the support to DNS"
}

variable "enable_dns_hostnames" {
    type = bool
    description = "Flag for enabling dns hostnames"
}

variable "private_map_public_ip_1" {
    type = bool
    description = "Flag for enabling ip public map on private subnet 1"
}

variable "private_map_public_ip_2" {
    type = bool
    description = "Flag for enabling ip public map on private subnet 2"
}

variable "environment" {
    type = string
    description = "Initial for the name of the environment"
}

variable "aws_security_group_tag" {
    type = string
    description = "Tag name for security group"
}