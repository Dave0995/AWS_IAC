resource "aws_iam_role" "mwaa_execution_role" {
  name = "mwaa-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "airflow.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "mwaa_execution_role_policy" {
  name   = "AWSMWAAEnvironmentPolicy"
  role   = aws_iam_role.mwaa_execution_role.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "airflow:CreateEnvironment",
      "Resource": "arn:aws:airflow:us-east-1:975050150843:environment/example"
    }
  ]
}
EOF
}


resource "aws_mwaa_environment" "airflow_instance" {
  dag_s3_path        = "dags/"
  execution_role_arn = aws_iam_role.mwaa_execution_role.arn

  logging_configuration {
    dag_processing_logs {
      enabled   = true
      log_level = "DEBUG"
    }

    scheduler_logs {
      enabled   = true
      log_level = "INFO"
    }

    task_logs {
      enabled   = true
      log_level = "WARNING"
    }

    webserver_logs {
      enabled   = true
      log_level = "ERROR"
    }

    worker_logs {
      enabled   = true
      log_level = "CRITICAL"
    }
  }

  name = "dave-mwaa-${var.environment}"

  network_configuration {
    security_group_ids = [var.security_group_id]
    subnet_ids         = var.private_subnets_id
  }

  source_bucket_arn = var.s3_airflow_bucket_arn
}