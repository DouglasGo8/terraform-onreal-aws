variable "AMI_OWNERS" {
  type    = list(string)
  default = ["099720109477"]
}

variable "PUB_SUBNET_1" {
  type    = string
  default = "subnet-07c99fd8fbb0c959e"
}

variable "SG_SSH" {
  type    = string
  default = "sg-06dcb8d5501a0dc45"
}

variable "AWS_REGION" {
  default = "sa-east-1"
}

variable "AWS_PROFILE" {
  default = "default"
}
