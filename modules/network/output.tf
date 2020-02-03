
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}
