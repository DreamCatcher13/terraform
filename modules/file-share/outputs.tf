output "key" {
  value = data.azurerm_storage_account.accnt.primary_access_key
}

output "acc_name" {
  value = var.strg_acc_name
}

