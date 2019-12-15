resource "aws_key_pair" "deployer-keypair" {
  public_key = "${file("${path.module}/aws_rsa.pub")}"
  key_name = "bootstrap-key"
}