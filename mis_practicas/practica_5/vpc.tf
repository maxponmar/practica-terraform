resource "aws_vpc" "vpc_california" {
  cidr_block = var.california_cidr
  tags = {
    Name = "vpc_california"
    environment = "dev"
  }
  provider = aws.california
}

resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "vpc_virginia"
    environment = "dev"
  }
  provider = aws.virginia
}

variable "california_cidr" {
  default = "10.10.0.0/16"
}

variable "virginia_cidr" {
  default = "10.10.0.0/16"
}