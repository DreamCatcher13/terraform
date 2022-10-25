data "azurerm_storage_account" "accnt" {
  name                = var.strg_acc_name
  resource_group_name = "NetworkWatcherRG"
}

resource "azurerm_storage_share" "filesh" {
  name                 = var.fshare_name
  storage_account_name = var.strg_acc_name
  quota                = var.st_quota
}

resource "azurerm_storage_share_directory" "dir" {
  name                 = var.dir_name
  share_name           = azurerm_storage_share.filesh.name
  storage_account_name = var.strg_acc_name
}
