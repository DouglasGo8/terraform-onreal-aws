# default value is an optional configuration
variable "profile" { default = "default" }

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "buzz_division" {
  type    = string
  default = "h3lls"
}
