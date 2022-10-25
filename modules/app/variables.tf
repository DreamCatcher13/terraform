variable "rsrc_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_subnet" {

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

variable "jsrvr" {
  type    = string
  default = "TOMCAT"
}

variable "jver" {
  type    = string
  default = "java11"
}

variable "jsver" {
  type    = number
  default = 9
}

