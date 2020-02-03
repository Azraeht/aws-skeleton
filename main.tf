##### Provider #####
provider "aws" {
  region                  = var.region
  shared_credentials_file = var.shared_credentials_file
  profile                 = var.profile
  version = "~> 2.19"
}

# data "terraform_remote_state" "network-state" {
#   backend = "s3"
#   config = {
#     profile        = "<YOUR PROFILE>"
#     region         = "eu-west-1"
#     bucket         = "<YOUR BUCKET>"
#     key            = "aws-skeleton-eu-west-1/terraform-network.tfstate"
#     dynamodb_table = "terraform-locks"
#   }
# }

module "network" {
  source = "./modules/network"
  env = var.env
  region = var.region

  keypair_name = var.keypair_name
  vpc_cidr_block = var.vpc_cidr_block
  vpc_subnet_availability_zones = var.vpc_subnet_availability_zones
}
