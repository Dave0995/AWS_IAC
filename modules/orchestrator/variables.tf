variable "security_group_id" {
    type = string
    description = "ID for the VPC security group"
}

variable "s3_airflow_bucket_arn" {
    description = "S3 bucket for airflow instance" 
}

variable "private_subnets_id" {
    type = list(string)
    description = "private subnets neede for the MWAA instance"
}

variable "environment" {
    type = string
    description = "Initial for the name of the environment"
}