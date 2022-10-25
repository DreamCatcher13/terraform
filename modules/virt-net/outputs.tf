output "vnet_id" {
 value = azurerm_virtual_network.myvnet.id
}

output "subnet_id" {
  value = azurerm_subnet.psqlsub.id
}

output "app_subnet" {
  value = azurerm_subnet.appsub.id
}

