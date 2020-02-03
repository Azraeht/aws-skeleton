### Bastions ###
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  count           = length(var.vpc_subnet_availability_zones)
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.bastion_size

  associate_public_ip_address = true
  subnet_id       = aws_subnet.public[count.index].id

  vpc_security_group_ids = [aws_security_group.bastion.id]

  key_name        = var.keypair_name
  tags = merge(
    map(
      "Env", var.env,
      "Region", var.region,
      "Name", "${var.region}-${var.env} - bastion"
    )
  )
}

resource "aws_security_group" "bastion" {
    name        = "bastion"
    description = "Bastion security group"
    vpc_id        = aws_vpc.vpc.id

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "bastion"
    }
}

resource "aws_security_group_rule" "bastion-sg" {
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow workstation to communicate with the Bastion"
  from_port         = var.public_ssh_port
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion.id
  to_port           = var.public_ssh_port
  type              = "ingress"
}
