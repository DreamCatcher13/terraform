resource "azurerm_resource_group" "mygroup" {
  name     = var.rsrc_name
  location = var.location
}

module "vnet" {
  source = "./modules/virt-net"
  
  rsrc_name = var.rsrc_name 
  location  = var.location
}

module "psql" {
  source = "./modules/psql-srvr"

  rsrc_name = var.rsrc_name
  location  = var.location
  vnet_id   = module.vnet.vnet_id
  subnet_id = module.vnet.psql_subnet
}

module "shared" {
  source = "./modules/file-share"
}

module "app" {
  source = "./modules/app"

  rsrc_name  = var.rsrc_name 
  location   = var.location
  app_subnet = module.vnet.app_subnet
  key        = module.shared.key
  acc_name   = module.shared.acc_name
  share_name = module.shared.share_name
  home       = module.shared.dir
  dns_name   = module.psql.dns_name
  db_name    = module.psql.db_name
  user       = module.psql.user 
  pass       = module.psql.pass
}
