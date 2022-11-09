output "dbs_name" {
  value = var.dbserver_name
}

output "db_name" {
  value = var.db_name
}

output "user" {
  value = var.pg_admin
}

output "pass" {
  value = var.admin_pass
}

output "psql_id" {
  value = azurerm_postgresql_flexible_server.mydbserver.id
}
