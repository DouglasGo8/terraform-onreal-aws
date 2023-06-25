variable "ENVIRONMENT" {
  type    = string
  default = "dev"
}

variable "ORG_TEAM" {
  type    = string
  default = "ARCH_CLOUD"
}

variable "AWS_REGION" {
  type    = string
  default = "sa-east-1"
}

variable "AWS_INSTANCE_TYPE" {
  type    = string
  default = "t3.micro"
}

variable "AWS_INSTANCE_KEY_PAIR_PEM" {
  type    = string
  default = "sign-key-pub"
}

