variable "region" {
  type = string
  description = "AWS region where we are going to allocate all resources"
}

variable "environment" {
  type = string
  description = "Initial of the deployment environment name"
}