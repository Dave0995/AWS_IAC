resource "aws_s3_bucket" "airflow_bucket" {
  bucket = "dave-airflow-bucket-${var.environment}"
}

resource "aws_s3_bucket" "data_contracts_bucket" {
  bucket = "dave-data-contracts-${var.environment}"
}

resource "aws_s3_bucket" "raw_data_bucket" {
  bucket = "dave-data-lake-customer-${var.environment}"
}