resource "aws_instance" "web_server" {
  ami = "${lookup(var.web_server_amis, var.aws_region)}"
  instance_type = "t2.micro"

  subnet_id = "${aws_default_subnet.learntf_default_subnet.id}"
  depends_on = ["aws_s3_bucket.learntf-bins"]
}

output "web_server_kpublic_ip" {
  value = "${aws_instance.web_server.public_ip}"
}

