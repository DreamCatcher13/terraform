variable "location" {
  type    = string
}

variable "rsrc_name" {
  type    = string
}

variable "vnet_id" {
 
}

variable "subnet_id" {

}

variable "dns_name" {
  type    = string
  default = "psql1337"
}

variable "dbserver_name" {
  type    = string
  default = "bucketv3"
}

variable "pg_admin" {
  type    = string
  default = "psqladmin"
}

variable "admin_pass" {
  type      = string
  sensitive = true
}

variable "db_storage" {
  type    = number
  default = 32768
}

variable "db_sku" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "db_name" {
  type    = string
  default = "gitbucket"
}
