module "bastion_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "${local.name}-bastion_public_instance"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-pub.key_name
  #
  vpc_security_group_ids = [module.bastion_instance_sg.security_group_id]

  subnet_id = module.main-vpc.public_subnets[0]
  tags      = local.common_tags

}

resource "aws_key_pair" "key-pub" {
  key_name   = "key-pub"
  public_key = file("../../../../.secret/key.pem.pub")
}