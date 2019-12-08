resource "aws_s3_bucket" "b" {
  bucket = "xwolf-tf-33-bucket"
  acl    = "private"
  tags = {
    Name = "My-bucket"
    Environment = "Dev"
  }
}