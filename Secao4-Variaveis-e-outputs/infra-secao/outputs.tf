output "storage_account_id" {
  value = azurerm_storage_account.first_storage.id
}

/*
neste caso o value assume o valor do id resultante da criaçao
do storage account.
*/