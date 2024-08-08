california_cidr = "10.10.0.0/16"
# public_subnet_cidr = "10.10.0.0/24"
# private_subnet_cidr = "10.10.1.0/24"
subnets = [ "10.10.0.0/24","10.10.1.0/24" ]

tags = {
  "environment" = "dev"
  "owner" = "Maximiliano"
  "IaC" = "Terraform"
  "project" = "Practica 6"
  "IaC_version" = "5.61.0"
}

sg_ssh_ingress_cidr = "0.0.0.0/0"
public_cidr = "0.0.0.0/0"