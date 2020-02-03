
resource "aws_route_table" "public_subnets_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = merge(
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env} - Public subnets route table"
    )
  )
}

resource "aws_route_table_association" "public_subnets_route_table_associations" {
  count = length(var.vpc_subnet_availability_zones)

  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_subnets_route_table.id
}

resource "aws_route_table" "private_subnets_route_table" {
  count = length(var.vpc_subnet_availability_zones)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gateway[count.index].id}"
  }

  tags = merge(
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env} - Private subnets route table"
    )
  )
}

resource "aws_route_table_association" "private_subnets_route_table_associations" {
  count = length(var.vpc_subnet_availability_zones)

  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_subnets_route_table[count.index].id
}
