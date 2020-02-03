###### Subnets #####
resource "aws_subnet" "public" {
  count = length(var.vpc_subnet_availability_zones)
  availability_zone = "${var.region}${var.vpc_subnet_availability_zones[count.index]}"
  cidr_block = cidrsubnet(var.vpc_cidr_block, 2, count.index)
  vpc_id            = "${aws_vpc.vpc.id}"
  tags = "${
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env} - public-${var.vpc_subnet_availability_zones[count.index]}"
    )
  }"
}
resource "aws_subnet" "private" {
  count = length(var.vpc_subnet_availability_zones)
  availability_zone = "${var.region}${var.vpc_subnet_availability_zones[count.index]}"
  cidr_block = cidrsubnet(var.vpc_cidr_block, 2, count.index + 2)
  vpc_id            = aws_vpc.vpc.id
  tags = "${
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env} - public-${var.vpc_subnet_availability_zones[count.index]}",
    )
  }"
}
