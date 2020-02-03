### Gateways ###
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env} - internet gateway"
    )
  )
}

resource "aws_eip" "nat_gateway_eip" {
  count = length(var.vpc_subnet_availability_zones)
  vpc = true

  tags = merge(
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env} - NAT Gateway"
    )
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  count = length(var.vpc_subnet_availability_zones)
  allocation_id = aws_eip.nat_gateway_eip[count.index].id
  subnet_id = aws_subnet.public[count.index].id

  tags = merge(
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env} - NAT Gateway"
    )
  )

  depends_on = [aws_internet_gateway.internet_gateway]
}
