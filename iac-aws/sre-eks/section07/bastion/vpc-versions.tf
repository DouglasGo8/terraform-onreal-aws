terraform {
  required_version = "~> 1.6.5"
  # registry.terraform.io
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.29"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}