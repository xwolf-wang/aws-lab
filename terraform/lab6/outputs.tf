output "web_server_kpublic_ip" {
  value = "${aws_instance.init_server.public_ip}"
}
