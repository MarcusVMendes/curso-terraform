resource "azurerm_resource_group" "first_group" {
  name     = "remote"
  location = "West Europe"
}

resource "azurerm_storage_account" "first_storage_account" {
  name                     = "marcusvmendes"
  resource_group_name      = azurerm_resource_group.first_group.name
  location                 = azurerm_resource_group.first_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "first_container" {
  name                  = "remotecontainer"
  storage_account_name  = azurerm_storage_account.first_storage_account.name
  container_access_type = "private"
}