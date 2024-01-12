resource "aws_s3_bucket" "airflow-bucket" {
  bucket = "dave-airflow-bucket-${var.environment}"
}

resource "aws_s3_bucket" "data-contracts-bucket" {
  bucket = "dave-data-contracts-${var.environment}"
}

resource "aws_s3_bucket" "raw-data-bucket" {
  bucket = "dave-data-lake-customer-${var.environment}"
}