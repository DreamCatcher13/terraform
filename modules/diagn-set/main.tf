resource "azurerm_log_analytics_workspace" "log_space" {
  name                = var.lg_name
  location            = var.location
  resource_group_name = var.rsrc
  sku                 = var.sku
  retention_in_days   = var.ret
}

data "azurerm_monitor_diagnostic_categories" "db_cat" {
  resource_id = var.psql_id
}

data "azurerm_monitor_diagnostic_categories" "app_cat" {
  resource_id = var.app_id
}

resource "azurerm_monitor_diagnostic_setting" "psql_setting" { 
  name                       = var.psql_diagn_name 
  target_resource_id         = var.psql_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_space.id
  
  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.db_cat.log_category_types
    content {
      category = log.value

      retention_policy {
        enabled = false
        days    = 0 
      }
    }
  }

  metric {
    category = "AllMetrics"
  
    retention_policy {
      enabled = false
    }
  }
}

