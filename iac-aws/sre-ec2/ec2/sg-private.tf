module "private_sg" {
  # https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest/examples/complete
  source                   = "terraform-aws-modules/security-group/aws"
  version                  = "5.0.0"
  #
  name                     = "private-sg"
  description              = "SSH & HTTP port open for VPC Block Range"
  # main_vpc
  vpc_id                   = "data.vpc_id" #module.vpc.vpc_id
  # ingress rules based on types over aws console
  ingress_rules            = ["ssh-tcp", "http-80-tcp"]
  # vpc block range (10.0.0.0/16)
  ingress_cidr_blocks      = "data.vpc_cidr_block" #module.vpc.vpc_cidr_block
  # egress rules
  egress_rules = ["all-all"]

  #
  tags = local.common_tags
}