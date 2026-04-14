provider "aws" {
  region = "ap-south-1"
}

# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "karthick-unique-bucket-12345"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}

# 🔐 Public Access Block (ADD HERE)
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}