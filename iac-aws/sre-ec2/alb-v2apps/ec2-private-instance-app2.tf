#resource "aws_key_pair" "key" {
#  key_name   = "key-pub"
#  public_key = file("../../../.secret/key.pub")
#}

module "ec2_private_instance_app2" {
  # vpc must be created first
  # depends_on = [module.vpc]
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.0.0"
  #
  name                   = "${var.ENVIRONMENT}-app2"
  #instance_count         = 1
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.AWS_INSTANCE_TYPE
  key_name               = var.AWS_INSTANCE_KEY_PAIR_PEM
  #monitoring             = true
  subnet_id              = "data.sub_net_private.id[0][1]###MUST_BE_IMPLEMENTED####"
  vpc_security_group_ids = "sg.private_http_port" #[module.private_sg.security_group_id]
  user_data              = file("${path.module}/httpd.sh")
  instance_count = "2??"
  #
  tags                   = local.common_tags
}

