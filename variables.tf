variable "location" {
  type    = "string"
  default = "North Europe"
}

variable "rsrc-name" {
  type    = "string"
  default = "gitbucketv4"
}

variable "vnet-name" {
  type    = "string"
  default = "ntwrk"
}

variable "vnet-addr" {
  type    = "string"
  default = "10.0.26.0/24"
}

variable "app-sub-name" {
  type    = "string"
  default = "gitbucket"
}

variable "app-pref" {
  type    = "string"
  default = "10.0.26.64/26"
}

variable "db-sub-name" {
  type    = "string"
  default = "pgsql"
}

variable "pg-pref" {
  type    = "string"
  default = "10.0.26.0/26"
}

variable "dns-name" {
  type    = "string"
  default = "psql"
}

variable "dbserver-name" {
  type    = "string"
  default = "bucketv4"
}

variable "pg-admin" {
  type    = "string"
  default = "psqladmin"
}

variable "admin-pass" {
  type    = "string"
  default = "p@ssw0rd"
}

variable "db-storage" {
  type    = "number"
  default = 32768
}

variable "db-sku" {
  type    = "string"
  default = "B_Standard_B1ms"
}

variable "db-name" {
  type    = "string"
  default = "gitbucket"
}

variable "fshare-name" {
  type    = "string"
  default = "share3"
}

variable "strg-acc-name" {
  type    = "string"
  default = "rand"
}

variable "st-quota" {
  type    = "number"
  default = 5
}

variable "dir-name" {
  type    = "string"
  default = "bucket"
}
