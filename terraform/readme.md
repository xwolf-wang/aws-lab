-generate the key
ssh-keygen -t rsa -b 4096 -f aws_rsa

-Environment
export TF_VAR_aws_access_key="AKIAUJ26H7EXMUZ42LAP"
export TF_VAR_aws_secret_key="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"

--
terraform plan -var target_env=prod

---
ssh -i aws_rsa ec2-user@3.14.244.223


---
sudo yum install -y wget unzip

wget https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip
sudo unzip terraform_0.12.17_linux_amd64.zip
sudo cp terraform /usr/local/bin