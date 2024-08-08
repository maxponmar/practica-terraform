variable "california_cidr" {
  description = "CIDR de la VPC de California"
  type = string
  sensitive = false
}

# variable "public_subnet_cidr" {
#   description = "CIDR de la public sunet"
#   type = string
#   sensitive = false
# }

# variable "private_subnet_cidr" {
#   description = "CIDR de la private sunet"
#   type = string
#   sensitive = false
# }

variable "subnets" {
  description = "Lista de subnets"
  type = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type = map(string)
}