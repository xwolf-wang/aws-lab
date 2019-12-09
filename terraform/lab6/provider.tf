provider "aws" {
  profile = "default"
  region = "${var.aws_region}"
  shared_credentials_file = "/Users/ming/.aws/credenticals"
}