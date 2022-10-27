resource "azurerm_private_dns_zone" "mydns" {
  name                 = "${var.dns_name}.postgres.database.azure.com"
  resource_group_name  = var.rsrc_name 
}

resource "azurerm_private_dns_zone_virtual_network_link" "mylink" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.mydns.name
  virtual_network_id    = var.vnet_id
  resource_group_name   = var.rsrc_name
}

resource "azurerm_postgresql_flexible_server" "mydbserver" {
  name                    = var.dbserver_name
  resource_group_name     = var.rsrc_name
  location                = var.location
  version                 = 14
  delegated_subnet_id     = var.subnet_id
  private_dns_zone_id     = azurerm_private_dns_zone.mydns.id
  administrator_login     = var.pg_admin
  administrator_password  = var.admin_pass
  zone                    = "1"

  storage_mb = var.db_storage

  sku_name   = var.db_sku
  depends_on = [azurerm_private_dns_zone_virtual_network_link.mylink] 
}

resource "azurerm_postgresql_flexible_server_database" "mydb" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.mydbserver.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

resource "azurerm_postgresql_flexible_server_configuration" "ssloff" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.mydbserver.id
  value     = "off"
}

