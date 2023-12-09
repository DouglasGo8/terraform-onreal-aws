# default value is an optional configuration
variable "profile" { default = "default" }

variable "region" {
  default = "sa-east-1"
}

variable "instance_count" {
  default = "1"
}

variable "instance_type" {
  default = "t2.nano"
}

variable "cidr_blocks" {
  type    = list(string)
  # Internet Edge Traffic
  default = ["0.0.0.0/0"]
}
