terraform {
  required_version = "~> 1.6.5"
  # registry.terraform.io
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.29"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

# VPC Default creation is Mandatory
resource "aws_instance" "t2-medium-demo" {
  count                  = var.instance_count
  ami                    = data.aws_ami.amzn2.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-ssh-http.id]
  key_name               = aws_key_pair.key-pub.key_name
  user_data              = <<EOF
    #!/bin/bash
    sudo su
    yum update -y
    yum -y install httpd.x86_64
    echo "Hello World from $(hostname -f)" > /var/www/html/index.html
    sudo systemctl enable httpd
    sudo systemctl start httpd
  EOF
  tags                   = {
    Name = "t2-nano-demo-instance-${count.index + 1}"
  }
}

resource "aws_key_pair" "key-pub" {
  key_name   = "key-pub"
  public_key = file("../../../../.secret/key.pem.pub")
}