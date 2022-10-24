resource "azurerm_resource_group" "mygroup" {
  name     = "gitbucketv3"
  location = "North Europe"
}

resource "azurerm_private_dns_zone" "mydns" {
  name = "psql.postgres.database.azure.com"
  resource_group_name  = azurerm_resource_group.mygroup.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mylink" {
  name = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.mydns.name
  virtual_network_id = azurerm_virtual_network.myvnet.id
  resource_group_name  = azurerm_resource_group.mygroup.name
}

resource "azurerm_postgresql_flexible_server" "mydbserver" {
  name                    = "bucketv3"
  resource_group_name     = azurerm_resource_group.mygroup.name
  location                = azurerm_resource_group.mygroup.location
  version                 = 14
  delegated_subnet_id     = azurerm_subnet.psqlsub.id
  private_dns_zone_id     = azurerm_private_dns_zone.mydns.id
  administrator_login     = "psqladmin"
  administrator_password  = "p@ssw0rd"

  storage_mb = 32768

  sku_name   = "B_Standard_B1ms"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.mylink] 
}

resource "azurerm_postgresql_flexible_server_database" "mydb" {
  name      = "gitbucket"
  server_id = azurerm_postgresql_flexible_server.mydbserver.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

resource "azurerm_postgresql_flexible_server_configuration" "ssloff" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.mydbserver.id
  value     = "off"
}

