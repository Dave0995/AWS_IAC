output "airflow_bucket_name" {
  description = "Name for airflow's bucket"
  value       = aws_s3_bucket.airflow_bucket.bucket
}

output "data_contracts_bucket_name" {
  description = "Name for data contracts' bucket"
  value       = aws_s3_bucket.data_contracts_bucket.bucket
}

output "raw_data_bucket_name" {
  description = "Name for raw data's bucket"
  value       = aws_s3_bucket.raw_data_bucket.bucket
}