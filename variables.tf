# Provider variables
variable "profile" {
  type = string
}
variable "shared_credentials_file" {
  type = string
}

# Common variables
variable "region" {
  type = string
}

variable "env" {
  type = string
}

variable "keypair_name" {
  type = string
}

# Network variables
variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_subnet_availability_zones" {
  type = map
  default = {
    "0" = "a"
    "1" = "b"
  }
}
