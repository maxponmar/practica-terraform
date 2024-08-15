terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
  required_version = "1.5.7"
}

provider "aws" {
  region = "us-west-1"
  default_tags {
    tags = var.tags
  }
}
