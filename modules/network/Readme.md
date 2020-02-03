# Networks module

This module allow creation of a network infrastructure based on:

* A VPC
* Several subnets (private and public) based on different availability zones
* Basic routing through IGW and Nat Gateway for private zones

## Architecture

* 1 VPC
* 1 Internet Gateway and _*n*_ NAT Gateway (with route to Internet Gateway) in public subnets
* _*n*_ public subnets (with route to Internet Gateway)
* _*n*_ private subnets (with route to the corresponding NAT Gateway)

## Setup

Provides the needed configuration through the *variables.tf* file
