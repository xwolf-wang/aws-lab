#!/bin/sh
sudo yum install -y httpd
sudo service httpd start
sudo groupadd www
sudo usermod -a -G www ec2-user
sudo usermod -a -G www apache
sudo chown -R apache:www /var/www
sudo chmod 770 -R /var/www
sudo yum install -y wget unzip
wget https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip
sudo unzip terraform_0.12.17_linux_amd64.zip
sudo cp terraform /usr/local/bin