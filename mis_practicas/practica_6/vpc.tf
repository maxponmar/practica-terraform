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
}