resource "aws_instance" "web_server" {
  ami = "${lookup(var.web_server_amis, var.aws_region)}"
  instance_type = "t2.micro"
}

/*
resource "aws_instance" "bastion" {
  ami = "${lookup(var.web_server_amis, var.aws_region)}"
  instance_type = "t2.micro"

  count = "${var.target_env == "dev" ? 1 : 2}"
}
*/

output "web_server_kpublic_ip" {
  value = "${aws_instance.web_server.public_ip}"
}

/*
output "bastion_ips" {
  value = "${aws_instance.bastion.*.private_ip}"
}

output "bastion_ip_0" {
  value = "${aws_instance.bastion.*.private_ip[0]}"
}
*/

data "template_file" "webserver_policy_template" {
  template = "${file("${path.module}/policy.tpl")}"

  vars = {
    arn = "${aws_instance.web_server.arn}"
  }

}

output "web_server_policy_output" {
  value = "${data.template_file.webserver_policy_template.rendered}"
}
