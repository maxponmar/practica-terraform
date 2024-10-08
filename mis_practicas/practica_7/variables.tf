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

variable "sg_ssh_ingress_cidr" {
  description = "CIDR for SSH ingress traffic"
  type = string
}

variable "public_cidr" {
  description = "CIDR for SSH ingress traffic"
  type = string
}

variable "ec2_specs" {
  description = "Parámetros de la instancia"
  type = map(string)
}


variable "enable_monitoring" {
  type = bool
  description = "Habilita el despliegue de un servidor de monitoreo"
}

variable "ingress_ports_list" {
  description = "Lista de puertos de ingress"
  type = list(number)
}
