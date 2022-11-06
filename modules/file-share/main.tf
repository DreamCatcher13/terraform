data "azurerm_storage_account" "accnt" {
  name                = var.strg_acc_name
  resource_group_name = "NetworkWatcherRG"
}

