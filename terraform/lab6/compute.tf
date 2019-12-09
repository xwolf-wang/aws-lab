resource "aws_instance" "init_server" {
  ami = "${lookup(var.web_server_amis, var.aws_region)}"
  instance_type = "t2.micro"


  key_name = "${aws_key_pair.init-keypair.key_name}"

  subnet_id = "${aws_default_subnet.learntf_default_subnet.id}"

  vpc_security_group_ids = ["${aws_security_group.int_server_sec_group.id}"]

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh"
    ]
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("${path.module}/aws_rsa")}"
    host = "${aws_instance.init_server.public_ip}"
  }

}


