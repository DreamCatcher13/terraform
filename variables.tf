variable "location" {
  type    = string
  default = "North Europe"
}

variable "rsrc_name" {
  type    = string
  default = "gitbucketv3"
}

variable "admin_pass" {
  type      = string
  sensitive = true
}

