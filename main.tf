resource "azurerm_resource_group" "mygroup" {
  name     = var.rsrc_name
  location = var.location
}

module "vnet" {
  source = "./modules/virt-net"
  
  rsrc_name = azurerm_resource_group.mygroup.name 
  location  = azurerm_resource_group.mygroup.location
}

module "psql" {
  source = "./modules/psql-srvr"

  rsrc_name  = azurerm_resource_group.mygroup.name 
  location   = azurerm_resource_group.mygroup.location
  vnet_id    = module.vnet.vnet_id
  subnet_id  = module.vnet.psql_subnet
}

module "shared" {
  source = "./modules/file-share"
}

module "app" {
  source = "./modules/app"

  rsrc_name  = azurerm_resource_group.mygroup.name 
  location   = azurerm_resource_group.mygroup.location
  app_subnet = module.vnet.app_subnet
  key        = module.shared.key
  acc_name   = module.shared.acc_name
  share_name = module.shared.azurerm_storage_share.filesh.name
  home       = module.shared.azurerm_storage_share_directory.dir.name
  dbs_name   = module.psql.azurerm_postgresql_flexible_server.mydbserver.name
  db_name    = module.psql.azurerm_postgresql_flexible_server_database.mydb.name
  user       = module.psql.azurerm_postgresql_flexible_server.mydbserver.administrator_login 
  pass       = module.psql.azurerm_postgresql_flexible_server.mydbserver.administrator_password
}

