locals {
  owners      = var.ORG_TEAM
  environment = var.ENVIRONMENT
  name        = "${local.owners}-${local.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}