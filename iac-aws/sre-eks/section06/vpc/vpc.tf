module "main-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block

  #
  azs = var.vpc_availability_zones

  #
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  # Database subnets
  database_subnets = var.vpc_database_subnets

  # Controls if database subnet group should be created
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  # Controls if separated route table for database should be created
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  # Controls if a nat gateway route should be created to give internet access to the database access
  # create_database_nat_gateway_route      = true
  # Controls if an internet gateway route for public database access should be created
  # create_database_internet_gateway_route = true

  # Outbound communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  # Not for production grade
  # Should be true if you want to provision a single shared NAT Gateway across all of your private
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS
  enable_dns_support   = true
  enable_dns_hostnames = true

  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  tags     = local.common_tags
  vpc_tags = local.common_tags

  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}


