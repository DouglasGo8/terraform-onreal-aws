# default value is an optional configuration
variable "profile" { default = "default" }

variable "region" {
  default = "sa-east-1"
}

variable "instance_count" {
  default = "1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_id" {
  default = "vpc-09ec278d2a58cafca"
}
# VPC default - Subnet iDs
#variable "subnets" {
#  default     = ["subnet-0552f38a9b6db4445", "subnet-036a697a2e7eaed7d", "subnet-086dd5358a9dc201c"]
#  type        = list
#  description = "Available Subnets"
#}