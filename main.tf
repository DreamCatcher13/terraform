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
}

module "shared" {
  source = "./modules/file-share"
}
