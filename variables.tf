variable "location" {
  type    = "string"
  default = "North Europe"
}

variable "rsrc_name" {
  type    = "string"
  default = "gitbucketv4"
}

variable "dns_name" {
  type    = "string"
  default = "psql"
}

variable "dbserver_name" {
  type    = "string"
  default = "bucketv4"
}

variable "pg_admin" {
  type    = "string"
  default = "psqladmin"
}

variable "admin_pass" {
  type      = "string"
  default   = "p@ssw0rd"
  sensitive = true
}

variable "db_storage" {
  type    = "number"
  default = 32768
}

variable "db_sku" {
  type    = "string"
  default = "B_Standard_B1ms"
}

variable "db_name" {
  type    = "string"
  default = "gitbucket"
}
