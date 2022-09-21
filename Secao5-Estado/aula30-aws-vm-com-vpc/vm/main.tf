terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }

  backend "s3" {
    bucket = "curso-terraform-bucket"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "marcusvmendes"
      managed-by = "terraform"
    }
  }
}

# acessando a vpc criada na aula 27 para pegar os id's
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "curso-terraform-bucket"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
