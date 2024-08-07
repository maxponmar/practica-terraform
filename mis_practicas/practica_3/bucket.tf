resource "random_string" "sufijo" {
  count = 3
  length = 8
  special = false
  upper = false
  numeric = false
}

resource "aws_s3_bucket" "proveedores" {
  count = 3
  bucket = "provedores-poncedev-${random_string.sufijo[count.index].id}"
  tags = {
    Owner = "Maximiliano"
    Environment = "Dev"
    Office = "Provedores"
  }
}

