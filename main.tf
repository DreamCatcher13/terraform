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
  admin_pass = var.admin_pass
}

module "shared" {
  source = "./modules/file-share"
}

module "insights" {
  source = "./modules/app-in"
  
  rsrc       = azurerm_resource_group.mygroup.name 
  location   = azurerm_resource_group.mygroup.location
}

module "app" {
  source = "./modules/app"

  rsrc_name  = azurerm_resource_group.mygroup.name 
  location   = azurerm_resource_group.mygroup.location
  app_subnet = module.vnet.app_subnet
  key        = module.shared.key
  acc_name   = module.shared.acc_name
  share_name = module.shared.share_name
  home       = module.shared.dir
  dbs_name   = module.psql.dbs_name
  db_name    = module.psql.db_name
  user       = module.psql.user 
  pass       = module.psql.pass
  inst_k     = module.insights.inst_k
  conn_strg  = module.insights.conn_strg
}

module "diagnostic" {
  source = "./modules/diagn-set"
 
  log_id    = module.insights.log_id
  psql_id   = module.psql.psql_id
  app_id    = module.app.app_id
}
