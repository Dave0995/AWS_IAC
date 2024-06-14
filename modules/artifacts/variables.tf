variable "region" {
    type = string
    description = "Location where the ECR repository is going to be created"
}

variable "account_id" {
    type = string
    description = "Account id that created the repository"
}

variable "application_id" {
    type = string
    description = "EMR Application id for submitting jobs"
}