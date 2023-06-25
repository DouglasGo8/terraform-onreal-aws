variable "AWS_REGION" {
  type    = string
  default = "sa-east-1"
}

variable "AWS_PROFILE" {
  type    = string
  default = "default"
}

# Project wide variable
variable "VPC_NAME" {
  type    = string
  default = "main-vpc"
}

variable "ENVIRONMENT" {
  type    = string
  default = "dev"
}

variable "ORG_TEAM" {
  type    = string
  default = "ARCH_CLOUD"
}

variable "VPC_CIDR_BLOCK" {
  type    = string
  default = "10.0.0.0/16"
}

variable "ZONES_ID" {
  type    = list(string)
  default = ["sa-east-1a", "sa-east-2b"]
}

variable VPC_PUBLIC_SUBNETS_CIDR {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable VPC_PRIVATE_SUBNETS_CIDR {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "VPC_DATABASE_SUBNETS" {
  type    = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]
}

variable "VPC_CREATE_DB_SUBNET_GROUP" {
  type    = bool
  default = true
}

variable "VPC_CREATE_DB_SUBNET_ROUTE_TABLE" {
  type    = bool
  default = true
}

variable "VPC_ENABLE_NAT_GATEWAY" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type        = bool
  default     = true
}

variable "VPC_IS_SINGLE_NAT_GATEWAY" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs"
  type        = bool
  default     = true
}

variable "VPC_ENABLE_DNS_HOST_NAMES" {
  type    = bool
  default = true
}

variable "VPC_ENABLE_DNS_SUPPORT" {
  type    = bool
  default = true
}