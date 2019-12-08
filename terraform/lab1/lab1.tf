provider "aws" {
  access_key = "AKIAUJ26H7EXBM6T3SXF"
  secret_key = "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"
  region = "us-east-2"
}

resource "aws_instance" "web_server" {
  ami = "ami-0520e698dd500b1d1"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "b" {
  bucket = "xwolf-tf-33-bucket"
  acl    = "private"
  tags = {
    Name = "My-bucket"
    Environment = "Dev"
  }
}

output "web_server_kpublic_ip" {
  value = "${aws_instance.web_server.public_ip}"
}



