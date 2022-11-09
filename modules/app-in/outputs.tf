output "log_id" {
  value = azurerm_log_analytics_workspace.log_space.id
}

output "inst_k" {
  value = azurerm_application_insights.app_ins.instrumentation_key
}

output "conn_strg" {
  value = azurerm_application_insights.app_ins.connection_string
}

