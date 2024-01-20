resource "aws_ecr_repository" "dave_repository" {
  name = "dave-repo"
}

resource "aws_ecr_repository_policy" "ecr_access_policy" {
  repository = aws_ecr_repository.dave_repository.name

  policy = <<EOF
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "EmrServerlessCustomImageSupport",
      "Effect": "Allow",
      "Principal": {
        "Service": "emr-serverless.amazonaws.com"
      },
      "Action": [
        "ecr:BatchGetImage",
        "ecr:DescribeImages",
        "ecr:GetDownloadUrlForLayer"
      ],
      "Condition":{
        "StringEquals":{
          "aws:SourceArn": "arn:aws:emr-serverless:${var.region}:${var.account_id}:/applications/${var.application_id}"
        }
      }
    }
  ]
}
  EOF
}
