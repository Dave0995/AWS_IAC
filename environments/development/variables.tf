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

variable "public_subnet_cidr_block" {
  type = string
  description = "IP ranges for the public subnet"
}

variable "public_availability_zone" {
  type = string
  description = "Availability zone for the public subnet"
}

variable "public_map_public_ip" {
  type = bool
  description = "Flag for activating the map public ip functionality in the public subnet"
}

variable "public_subnet_tag_name" {
  type = string
  description = "Tag name for the public subnet"
}

variable "private_subnet_cidr_block" {
  type = string
  description = "IP ranges for the private subnet"
}

variable "private_availability_zone" {
  type = string
  description = "Availability zone for the private subnet"
}

variable "private_map_public_ip" {
  type = bool
  description = "Flag for activating the map public ip functionality in the public subnet"
}

variable "private_subnet_tag_name" {
  type = string
  description = "Tag name for the private subnet"
}

variable "internet_gateway_tag" {
  type = string
  description = "Tag name for the IGW"
}

variable "public_route_table_tag" {
  type = string
  description = "Tag name for the route table"
}