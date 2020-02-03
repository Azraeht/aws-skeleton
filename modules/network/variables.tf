# Common variables
variable "region" {
  type = string
}
variable "env" {
  type = string
}

# VPC variables
variable "vpc_cidr_block" {
  type = string
}

variable "vpc_subnet_availability_zones" {
  type = map
}

# Bastion
variable "bastion_size" {
  type = string
  default = "t2.micro"
}

variable "keypair_name" {
  type = string
}

variable "public_ssh_port" {
  type = string
  default = "22"
}
