provider "aws" {
  access_key = "AKIAUJ26H7EXMUZ42LAP"
  secret_key = "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"
  region = "us-east-2"
}

resource "aws_instance" "web_server" {
  ami = "ami-0520e698dd500b1d1"
  instance_type = "t2.micro"
}


output "web_server_kpublic_ip" {
  value = "${aws_instance.web_server.public_ip}"
}



