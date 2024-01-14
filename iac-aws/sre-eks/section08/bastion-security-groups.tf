module "bastion_instance_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.1.0"
  #
  name        = "${local.name}-bastion-public-instance-sg"
  description = "Security Group with SSH Port open for everyone (IPv4 CIDR) open with VPC, egress port opened 4web"

  vpc_id = module.main-vpc.vpc_id

  # Ingress Rules and CIDR
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"] # open 4web
  # Egress Rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}