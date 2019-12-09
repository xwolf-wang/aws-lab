resource "aws_key_pair" "init-keypair" {
  public_key = "${file("${path.module}/aws_rsa.pub")}"
  key_name = "init-key"
}