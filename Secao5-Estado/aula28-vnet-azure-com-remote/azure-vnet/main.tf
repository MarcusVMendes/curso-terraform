terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.23.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "remote"
    storage_account_name = "marcusvmendes"
    container_name       = "remotecontainer"
    key                  = "azure-vnet/terraform.tfstate" # nome da pasta que vai armazenar o estado remoto.
  }
}

provider "azurerm" {
  features {}
}