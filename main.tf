resource "aws_s3_bucket" "john_test_bucket" {
  bucket = "john_test_bucket"
  tags = {
    Name        = "john_test_bucket"
    Environment = "Production"
  }
}

