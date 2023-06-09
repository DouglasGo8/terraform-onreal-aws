variable "AMI_OWNERS" {
  type    = list(string)
  default = ["099720109477"]
}

variable "PUB_SUBNET_1" {
  type    = string
  default = "subnet-0cb4ca829c6b717b3"
}

variable "SG_SSH" {
  type    = string
  default = "sg-001dd6fa41ef4df90"
}
