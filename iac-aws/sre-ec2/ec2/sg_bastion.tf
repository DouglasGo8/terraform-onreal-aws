module "bastion_sg" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.0.0"
  #
  name                = "bastion-public-sg"
  description         = "SSH port open for internet"
  # main_vpc
  vpc_id              = "data.vpc_id "#module.vpc.vpc_id
  # ingress rules
  ingress_rules       = ["ssh-tcp"]
  # internet range
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # egress rules
  egress_rules        = ["all-all"]

  #
  tags = local.common_tags
}