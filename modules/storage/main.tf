resource "aws_s3_bucket" "data_contracts_bucket" {
  bucket = "dave-data-contracts-${var.environment}"
}

resource "aws_s3_bucket" "raw_data_bucket" {
  bucket = "dave-data-lake-customer-${var.environment}"
}

resource "aws_s3_bucket" "airflow_bucket" {
  bucket = "dave-airflow-bucket-${var.environment}"
}

resource "aws_s3_bucket_versioning" "airflow_bucket" {
  bucket = aws_s3_bucket.airflow_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "airflow_bucket" {
  bucket = aws_s3_bucket.airflow_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.airflow_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
