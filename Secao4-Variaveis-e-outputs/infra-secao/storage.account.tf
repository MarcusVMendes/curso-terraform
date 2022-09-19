resource "azurerm_resource_group" "first_resource_group" {
  name     = ""
  location = var.location
}

resource "azurerm_storage_account" "first_storage" {
  name                     = ""
  resource_group_name      = ""
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
}