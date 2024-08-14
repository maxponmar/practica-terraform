resource "aws_vpc" "vpc_california" {
  cidr_block = var.california_cidr
  tags = {
    Name = "vpc_california"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_california.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_california.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "private_subnet"
  }
  depends_on = [ aws_subnet.public_subnet ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_california.id
  tags = {
    Name = "IGW VPC California"
  }
}


resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_california.id

  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public CRT"
  }
}

resource "aws_route_table_association" "crt_association_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}



resource "aws_security_group" "public_instance_sg" {
  name        = "Public Instance SG"
  description = "Allow SSH inboud traffic and ALL egress traffic"
  vpc_id      = aws_vpc.vpc_california.id

  tags = {
    Name = "Public Instance SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.public_instance_sg.id

  cidr_ipv4   = var.sg_ssh_ingress_cidr
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22

  tags = {
    Name = "Allow SSH Rule"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_public" {
  security_group_id = aws_security_group.public_instance_sg.id

  cidr_ipv4   = var.public_cidr
  from_port   = 0
  ip_protocol = "tcp"
  to_port     = 0

  tags = {
    Name = "Allow Public Egress Traffic Rule"
  }
}
