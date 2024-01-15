variable "public_availability_zone" {
    type = string
    description = "Availability zone for the public VPC subnet"
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

variable "public_subnet_tag_name" {
    type = string
    description = "Tag name for the public subnet"
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

variable "public_route_table_tag" {
    type = string
    description = "Tag name for public route table"
}

variable "vpc_cidr_block" {
    type = string
    description = "IP range values for vpc"
}

variable "public_subnet_cidr_block" {
    type = string
    description = "IP range values for public subnet"
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

variable "public_map_public_ip" {
    type = bool
    description = "Flag for enabling ip public map on public subnet"
}

variable "private_map_public_ip_1" {
    type = bool
    description = "Flag for enabling ip public map on private subnet 1"
}

variable "private_map_public_ip_2" {
    type = bool
    description = "Flag for enabling ip public map on private subnet 2"
}