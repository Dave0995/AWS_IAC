resource "aws_iam_role" "mwaa_execution_role" {
  name = "DaveMWAAExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = [
            "airflow-env.amazonaws.com",
            "airflow.amazonaws.com"
          ]
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "mwaa_execution_policy" {
  name        = "tu-politica"
  description = "Descripción de tu política"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "airflow:PublishMetrics",
            "Resource": "arn:aws:airflow:us-east-1:975050150843:environment/dave-mwaa-d"
        },
        {
            "Effect": "Deny",
            "Action": "s3:ListAllMyBuckets",
            "Resource": [
                "arn:aws:s3:::dave-airflow-bucket-d",
                "arn:aws:s3:::dave-airflow-bucket-d/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject*",
                "s3:GetBucket*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::dave-airflow-bucket-d",
                "arn:aws:s3:::dave-airflow-bucket-d/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:CreateLogGroup",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:GetLogRecord",
                "logs:GetLogGroupFields",
                "logs:GetQueryResults"
            ],
            "Resource": [
                "arn:aws:logs:us-east-1:975050150843:log-group:airflow-dave-mwaa-d-*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:DescribeLogGroups"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": "cloudwatch:PutMetricData",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "sqs:ChangeMessageVisibility",
                "sqs:DeleteMessage",
                "sqs:GetQueueAttributes",
                "sqs:GetQueueUrl",
                "sqs:ReceiveMessage",
                "sqs:SendMessage"
            ],
            "Resource": "arn:aws:sqs:us-east-1:*:airflow-celery-*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt",
                "kms:DescribeKey",
                "kms:GenerateDataKey*",
                "kms:Encrypt"
            ],
            "NotResource": "arn:aws:kms:*:975050150843:key/*",
            "Condition": {
                "StringLike": {
                    "kms:ViaService": [
                        "sqs.us-east-1.amazonaws.com"
                    ]
                }
            }
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "example_attachment" {
  policy_arn = aws_iam_policy.mwaa_execution_policy.arn
  role       = aws_iam_role.mwaa_execution_role.name
}

resource "aws_mwaa_environment" "airflow_instance" {
  dag_s3_path        = "dags/"
  execution_role_arn = aws_iam_role.mwaa_execution_role.arn
  webserver_access_mode = "PUBLIC_ONLY"
  name = "dave-mwaa-${var.environment}"

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

  network_configuration {
    security_group_ids = [var.security_group_id]
    subnet_ids         = var.private_subnets_id
  }

  source_bucket_arn = var.s3_airflow_bucket_arn
}
