variable "lg_name" {
  type    = string
  default = "gitbucket-log-space"
}

variable "location" {
  type = string
}

variable "rsrc" {
  type = string
}

variable "sku" {
  type    = string
  default = "PerGB2018"
}

variable "ret" {
  type    = number
  default = 30
}

variable "psql_id" {

}

variable "app_id" {

}

variable "psql_diagn_name" {
  type    = string
  default = "psql_db_diagn"
}

variable "app_diagn_name" {
  type    = string
  default = "app_diagn"
}
