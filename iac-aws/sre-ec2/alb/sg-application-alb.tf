module "application_alb_http_sg" {
  # https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest/examples/complete
  source                   = "terraform-aws-modules/security-group/aws"
  version                  = "5.0.0"
  #
  name                     = "loadbalancer-sg"
  description              = "Security Group with HTTP open for entire Internet (IPv4 CIDR), egress ports are all world open"
  # main_vpc
  vpc_id                   = "data.vpc_id" #module.vpc.vpc_id
  # ingress rules based on types over aws console
  ingress_rules            = ["http-80-tcp"]
  # vpc block range (10.0.0.0/16)
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  # egress rules
  egress_rules             = ["all-all"]
  #
  tags                     = local.common_tags
  #
  ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Allow port 81 from internet"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
