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

  virtual_network_subnet_id = var.app_subnet

  site_config {

    application_stack {
      java_server         = "TOMCAT"
      java_version        = "java11"
      java_server_version = "9.0"
    }

    vnet_route_all_enabled    = true
  }
  app_settings = {
    "GITBUCKET_HOME"        : "/mnt/${var.home}"
    "GITBUCKET_DB_URL"      : "jdbc:postgresql://${var.dbs_name}.postgres.database.azure.com:5432/${var.db_name}"
    "GITBUCKET_DB_USER"     : "${var.user}"
    "GITBUCKET_DB_PASSWORD" : "${var.pass}"
  } 
  
  storage_account {
    access_key   = var.key
    account_name = var.acc_name
    name         = "my_storage"
    share_name   = var.share_name
    type         = "AzureFiles"
    mount_path   = "/mnt"
  }   

  provisioner "local-exec" {
    command = "az webapp stop --name ${azurerm_linux_web_app.myapp.name} --resource-group ${var.rsrc_name}"
  }

  provisioner "local-exec" {
    command = "az webapp start --name ${azurerm_linux_web_app.myapp.name} --resource-group ${var.rsrc_name}"
  }


}


