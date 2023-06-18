module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  # VPC Details
  name            = "${local.name}-${var.PROJECT_NAME}"
  cidr            = var.VPC_CIDR_BLOCK
  # reduce cost
  azs             = var.ZONES_ID
  public_subnets  = var.VPC_PUBLIC_SUBNET_CIDR
  private_subnets = var.VPC_PRIVATE_SUBNET_CIDR

  # Database subnets
  database_subnets                   = var.VPC_DATABASE_SUBNETS
  create_database_subnet_group       = var.VPC_CREATE_DB_SUBNET_GROUP
  create_database_subnet_route_table = var.VPC_CREATE_DB_SUBNET_ROUTE_TABLE
  # For private subnets to enable outbound communication
  # create_database_nat_gateway_route  = true
  # For public subnets
  # create_database_internet_gateway   = true
  # enables outbound communication
  enable_nat_gateway                 = var.VPC_ENABLE_NAT_GATEWAY
  # low cost
  single_nat_gateway                 = var.VPC_IS_SINGLE_NAT_GATEWAY
  enable_dns_hostnames               = var.VPC_ENABLE_DNS_HOST_NAMES
  enable_dns_support                 = var.VPC_ENABLE_DNS_SUPPORT

  public_subnet_tags = {
    Name = "public-subnets"
  }

  private_subnet_tags = {
    Name = "private-subnets"
  }

  database_subnet_tags = {
    Name = "database-subnets"
  }

  tags     = local.common_tags
  vpc_tags = local.common_tags
}


