resource "aws_vpc" "vpc_california" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc_california"
    environment = "dev"
  }
  provider = aws.california
}

resource "aws_vpc" "vpc_virginia" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc_virginia"
    environment = "dev"
  }
  provider = aws.virginia
}