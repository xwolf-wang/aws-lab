resource "aws_instance" "web_server" {
  ami = "${lookup(var.web_server_amis, var.aws_region)}"
  instance_type = "t2.micro"

  subnet_id = "${aws_default_subnet.learntf_default_subnet.id}"
  depends_on = ["aws_s3_bucket.learntf-bins"]

  key_name = "${aws_key_pair.deployer-keypair.key_name}"

  vpc_security_group_ids = ["${aws_security_group.web_server_sec_group.id}"]

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "file" {
    source = "httpd.conf"
    destination = "/tmp/httpd.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh"
    ]
  }

  provisioner "file" {
    source = "index.html"
    destination = "/var/www/html/index.html"
  }



  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("${path.module}/aws_rsa")}"
    host = "${aws_instance.web_server.public_ip}"
  }

}

output "web_server_kpublic_ip" {
  value = "${aws_instance.web_server.public_ip}"
}

