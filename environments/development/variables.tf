variable "region" {
  type = string
  description = "AWS region where we are going to allocate all resources"
}

variable "environment" {
  type = string
  description = "Initial of the deployment environment name"
}

variable "vpc_cidr_block" {
  type = string 
  description = "Ip ranges for the VPC network"
}

variable "enable_dns_support" {
  type = bool
  description = "Flag for determing if we are going to support DNS"
}

variable "enable_dns_hostnames" {
  type = bool
  description = "Flag for determing if we are going to support DNS hostnames"
}

variable "vpc_tag_name" {
  type = string
  description = "Tag name for the VPC network"
}

variable "public_subnet_cidr_block_1" {
  type = string
  description = "IP ranges for the public subnet 1"
}

variable "public_availability_zone_1" {
  type = string
  description = "Availability zone for the public subnet 1"
}

variable "public_map_public_ip_1" {
  type = bool
  description = "Flag for activating the map public ip functionality in the public subnet 1"
}

variable "public_subnet_tag_name_1" {
  type = string
  description = "Tag name for the public subnet 1"
}

variable "public_subnet_cidr_block_2" {
  type = string
  description = "IP ranges for the public subnet 2"
}

variable "public_availability_zone_2" {
  type = string
  description = "Availability zone for the public subnet 2"
}

variable "public_map_public_ip_2" {
  type = bool
  description = "Flag for activating the map public ip functionality in the public subnet 2"
}

variable "public_subnet_tag_name_2" {
  type = string
  description = "Tag name for the public subnet 2"
}

variable "private_subnet_cidr_block_1" {
  type = string
  description = "IP ranges for the private subnet 1"
}

variable "private_availability_zone_1" {
  type = string
  description = "Availability zone for the private subnet 1"
}

variable "private_map_public_ip_1" {
  type = bool
  description = "Flag for activating the map public ip functionality in the public subnet 1"
}

variable "private_subnet_tag_name_1" {
  type = string
  description = "Tag name for the private subnet 1"
}

variable "private_subnet_cidr_block_2" {
  type = string
  description = "IP ranges for the private subnet 2"
}

variable "private_availability_zone_2" {
  type = string
  description = "Availability zone for the private subnet 2"
}

variable "private_map_public_ip_2" {
  type = bool
  description = "Flag for activating the map public ip functionality in the public subnet 2"
}

variable "private_subnet_tag_name_2" {
  type = string
  description = "Tag name for the private subnet 2"
}

variable "internet_gateway_tag" {
  type = string
  description = "Tag name for the IGW"
}

variable "public_route_table_tag" {
  type = string
  description = "Tag name for the route table"
}

variable "aws_security_group_tag" {
    type = string
    description = "Tag name for security group"
}

variable "private_route_table_tag_1" {
    type = string
    description = "Tag name for private route table 1"
}

variable "private_route_table_tag_2" {
    type = string
    description = "Tag name for private route table 2"
}
