terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
  required_version = "1.5.7"
}

provider "aws" {
  region = "us-west-1"
  alias = "california"
}

provider "aws" {
  region = "us-east-1"
  alias = "virginia"
}