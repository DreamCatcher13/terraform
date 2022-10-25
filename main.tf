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

  rsrc_name = var.rsrc_name 
  location  = var.location
  app_subnet = module.vnet.app_subnet
  key
  acc_name
  share_name
  dir
}
