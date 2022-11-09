resource "azurerm_monitor_action_group" "action" {
  name                = var.act_name
  resource_group_name = var.rsrc
  short_name          = var.short

  email_receiver {
    name          = var.e_name
    email_address = var.mail
  }
}

resource "azurerm_monitor_metric_alert" "metr1" {
  name                = "bckt-cpu-metr"
  resource_group_name = var.rsrc
  scopes              = [var.app_id]
  description         = "Metric cpu for gitbucket app"
  
  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "CpuTime"
    aggregation      = "Total"
    operator         = "GreaterThanOrEqual"
    threshold        = 3
  }

  action {
    action_group_id = azurerm_monitor_action_group.action.id
  }

  severity  = 3
  frequency = "PT5M"
}

resource "azurerm_monitor_metric_alert" "metr2" {
  name                = "bckt-mem-metr"
  resource_group_name = var.rsrc
  scopes              = [var.app_id]
  description         = "Metric memory for gitbucket app"
  
  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "MemoryWorkingSet"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 150000000
  }

  action {
    action_group_id = azurerm_monitor_action_group.action.id
  }

  severity  = 3
  frequency = "PT5M"
}

resource "azurerm_monitor_metric_alert" "metr3" {
  name                = "bckt-404-metr"
  resource_group_name = var.rsrc
  scopes              = [var.app_id]
  description         = "Metric 404 for gitbucket app"
  
  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http404"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1
  }

  action {
    action_group_id = azurerm_monitor_action_group.action.id
  }

  severity  = 1
  frequency = "PT5M"
}

