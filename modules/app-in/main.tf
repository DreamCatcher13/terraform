resource "azurerm_log_analytics_workspace" "log_space" {
  name                = var.lg_name
  location            = var.location
  resource_group_name = var.rsrc
  sku                 = var.sku
  retention_in_days   = var.ret
}

resource "azurerm_application_insights" "app_ins" {
  name                = var.ins_name
  location            = var.location
  resource_group_name = var.rsrc
  workspace_id        = azurerm_log_analytics_workspace.log_space.id
  application_type    = "web"
}
