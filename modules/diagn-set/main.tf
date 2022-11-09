data "azurerm_monitor_diagnostic_categories" "db_cat" {
  resource_id = var.psql_id
}

data "azurerm_monitor_diagnostic_categories" "app_cat" {
  resource_id = var.app_id
}

data "azurerm_monitor_diagnostic_categories" "vnet_cat" {
  resource_id = var.vnet_id
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

resource "azurerm_monitor_diagnostic_setting" "app_setting" { 
  name                       = var.app_diagn_name 
  target_resource_id         = var.app_id
  log_analytics_workspace_id = var.log_id
  
  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.app_cat.log_category_types
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

resource "azurerm_monitor_diagnostic_setting" "vnet_setting" { 
  name                       = var.vnet_diagn_name 
  target_resource_id         = var.vnet_id
  log_analytics_workspace_id = var.log_id
  
  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.vnet_cat.log_category_types
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


