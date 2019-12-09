provider "aws" {
  access_key = "key"
  secret_key = "secret"
  region = "us-east-2"
}

resource "aws_instance" "web_server" {
  ami = "ami-0520e698dd500b1d1"
  instance_type = "t2.micro"
}


output "web_server_kpublic_ip" {
  value = "${aws_instance.web_server.public_ip}"
}



