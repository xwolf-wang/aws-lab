resource "aws_default_subnet" "learntf_default_subnet" {
  availability_zone = "us-east-2a"
}

resource "aws_security_group" "int_server_sec_group" {
  name = "init-sec-group"

  ingress {
    from_port = 0
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}