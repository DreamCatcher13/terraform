variable "rsrc_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_subnet" {

}

variable "key" {
  sensitive = true
}

variable "inst_k" {
  sensitive = true
}

variable "conn_strg" {
  sensitive = true
}


variable "acc_name" {

}

variable "share_name" {

}

variable "home" {
 
}

variable  "dbs_name" {

}

variable  "db_name" {

}

variable  "user" {

}  

variable "pass" {
 sensitive = true
}

variable "plan_name" {
  type    = string
  default = "appGitbucketServicePlan"
}

variable "os" {
  type    = string
  default = "Linux"
}

variable "plan_sku" {
  type    = string
  default = "S1"
}

variable "app_name" {
  type    = string
  default = "another-gitbucket"
}


