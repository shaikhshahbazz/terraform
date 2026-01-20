terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# IAM User
resource "aws_iam_user" "shahbazz" {
  name = "shahbazz-user"
}

# Attach AmazonS3FullAccess (correct ARN)
resource "aws_iam_user_policy_attachment" "shahbazz_s3_full_access" {
  user       = aws_iam_user.shahbazz.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
