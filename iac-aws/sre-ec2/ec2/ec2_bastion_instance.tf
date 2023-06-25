#resource "aws_key_pair" "key" {
#  key_name   = "key-pub"
#  public_key = file("../../../.secret/key.pub")
#}

module "ec2_bastion_instance" {
  # vpc must be created first
  # depends_on = [module.vpc]
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.0.0"
  #
  name                   = "${var.ENVIRONMENT}-BastionHost"
  #instance_count         = 1
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.AWS_INSTANCE_TYPE
  key_name               = var.AWS_INSTANCE_KEY_PAIR_PEM
  #monitoring             = true
  subnet_id              = "data.subnet_public.id###MUST_BE_IMPLEMENTED####"
  vpc_security_group_ids = [module.bastion_sg.security_group_id]
  user_data              = file("${path.module}/httpd.sh")
  #
  tags                   = local.common_tags
}


