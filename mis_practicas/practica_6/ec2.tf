resource "aws_instance" "public_instance" {
  ami = "ami-0fda60cefceeaa4d3"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  tags = {
    Name = "public_instance"
  }
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [ aws_security_group.public_instance_sg.id ]

  lifecycle {
    create_before_destroy = true
  }
}