resource "aws_s3_bucket" "learntf-bins" {
  bucket = "xwolf-tf-33-bucket"
  acl    = "public-read"
}

output "bucket_url" {
  value = "${aws_s3_bucket.learntf-bins.bucket_domain_name}"
}