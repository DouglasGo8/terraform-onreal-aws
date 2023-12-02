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

resource "aws_instance" "t2-nano-demo" {
  count                  = var.instance_count
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc-web.id]
  key_name               = aws_key_pair.key-pub.key_name
  tags                   = {
    Name = "t2-nano-webapp-instance-${count.index + 1}"
  }
}

resource "aws_key_pair" "key-pub" {
  key_name   = "key-pub"
  public_key = file("../../../.secret/key.pem.pub")
}