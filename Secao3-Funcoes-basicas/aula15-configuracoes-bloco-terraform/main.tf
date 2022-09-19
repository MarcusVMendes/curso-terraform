terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
        version = "> 3.50.0"
        source = "hashicorp/aws"
    }

    azurerm = {
        version = "2.70.0"
        source = "hashicorop/azurerm"
    }
  }
}