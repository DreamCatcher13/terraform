variable "rsrc_name" {
  type = string
}

variable "location" {
  type = string
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
