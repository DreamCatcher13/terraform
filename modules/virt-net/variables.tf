variable "location" {
  type    = string
}

variable "rsrc_name" {
  type    = string
}

variable "vnet_name" {
  type    = string
  default = "ntwrk"
}

variable "vnet_addr" {
  type    = string
  default = "10.0.26.0/24"
}

variable "app_sub_name" {
  type    = string
  default = "gitbucket"
}

variable "app_pref" {
  type    = string
  default = "10.0.26.64/26"
}

variable "db_sub_name" {
  type    = string
  default = "pgsql"
}

variable "pg_pref" {
  type    = string
  default = "10.0.26.0/26"
}
