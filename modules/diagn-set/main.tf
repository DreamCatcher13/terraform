data "azurerm_monitor_diagnostic_categories" "db_cat" {
  resource_id = var.psql_id
}

data "azurerm_monitor_diagnostic_categories" "app_cat" {
  resource_id = var.app_id
}

resource "azurerm_monitor_diagnostic_setting" "psql_setting" { 
  name                       = var.psql_diagn_name 
  target_resource_id         = var.psql_id
  log_analytics_workspace_id = var.log_id
  
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

