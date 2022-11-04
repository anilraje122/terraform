resource "aws_s3_bucket" "admin-bucket" {
  bucket = "admin-bucket-04112022"
  tags = {
    env = "dev"
  }
}

