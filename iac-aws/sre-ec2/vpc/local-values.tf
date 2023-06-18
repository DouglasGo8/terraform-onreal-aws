locals {
  owners      = var.BUZZ_DIVISION
  environment = var.ENVIRONMENT
  name        = "${local.owners}-${local.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}