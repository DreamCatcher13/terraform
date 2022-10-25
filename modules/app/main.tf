resource "azurerm_service_plan" "myplan" {
  name                = var.plan_name
  resource_group_name = var.rsrc_name
  location            = var.location
  os_type             = var.os
  sku_name            = var.plan_sku  
}

resource "azurerm_linux_web_app" "myapp" {
  name                = var.app_name
  resource_group_name = var.rsrc_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.myplan.id

  site_config {

    application_stack {
      java_server         = var.jsrvr
      java_version        = var.jver
      java_server_version = var.jsver
    }

    virtual_network_subnet_id = var.app_subnet
    vnet_route_all_enabled    = true

    
  }

}


