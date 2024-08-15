resource "aws_s3_bucket" "cerberus_bucket" {
  bucket = "cerberus-bucket-${local.s3-sufix}"
}
