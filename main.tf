resource "aws_s3_bucket" "tygermanbucket" {
  bucket = "tygermanbucket"
  tags = {
    Environment = "dev"
    Name        = "tygermanbucket"
  }
  tags_all = {
        "Environment" = "dev"
        "Name"        = "tygermanbucket"
  }
}