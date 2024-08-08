resource "aws_instance" "public_instance" {
  ami = "ami-0fda60cefceeaa4d3"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  tags = {
    Name = "public_instance"
  }
}