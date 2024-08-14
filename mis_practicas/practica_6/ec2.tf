resource "aws_instance" "public_instance" {
  ami = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id = aws_subnet.public_subnet.id
  tags = {
    Name = "public_instance"
  }
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [ aws_security_group.public_instance_sg.id ]

  user_data = file("scripts/userdata.sh")

  # lifecycle {
  #   create_before_destroy = true
  # }

  provisioner "local-exec" {
    command = "echo intancia con IP ${aws_instance.public_instance.public_ip} > datos_instancia.txt"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo intancia con IP ${self.public_ip} > datos_instancia.txt"
  }

  # provisioner "remote-exec" {
  #   inline = [ "echo 'hola mundo' > ~/saludo.txt" ]

  #   connection {
  #     type = "ssh"
  #     host = self.public_ip
  #     user = "ec2-user"
  #     private_key = file("mykey.pem")
  #   }
  # }
}
