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

variable "ins_name" {
  type = string
  default = "gitbucket-insights"
}
