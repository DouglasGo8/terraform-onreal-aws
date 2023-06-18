module "main_vpc" {
  source = "../vpc/module"
}

provider "aws" {
  region  = var.AWS_REGION
  profile = var.AWS_PROFILE
}

resource "aws_instance" "t2-micro-inst" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.ssh.id]
  key_name               = aws_key_pair.key.key_name
  subnet_id              = data.aws_subnet.main-public-1.id
  user_data              = file("${path.module}/httpd.sh")
  tags = {
    Name = "EC2-Demo-Instance"
  }

}

resource "aws_key_pair" "key" {
  key_name   = "key-pub"
  public_key = file("../../../.secret/key.pub")
}
