#!/bin/sh
sudo yum install -y wget unzip
wget https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip
sudo unzip terraform_0.12.17_linux_amd64.zip
sudo cp terraform /usr/local/bin
sudo yum install -y git
git clone https://github.com/xwolf-wang/aws-lab.git