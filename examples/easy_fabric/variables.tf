variable "ndfc_username" {
  type    = string
  default = "admin"
}

variable "ndfc_password" {
  type      = string
  sensitive = true
}

variable "ndfc_url" {
  type        = string
  description = "URL of ND cluster hosting NDFC eg. https:\\192.168.10.10"
}
