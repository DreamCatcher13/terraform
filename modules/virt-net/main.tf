resource "azurerm_virtual_network" "myvnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rsrc_name
  address_space       = ["${var.vnet_addr}"]
}

resource  "azurerm_subnet" "appsub" {
  name                 = var.app_sub_name
  resource_group_name  = var.rsrc_name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["${var.app_pref}"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "del"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "psqlsub" {
  name                 = var.db_sub_name
  resource_group_name  = var.rsrc_name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["${var.pg_pref}"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }  
  }
}


