##### VPC #####
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env}-vpc",
    )
  )
}
