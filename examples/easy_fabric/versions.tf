terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "1.2.7"
    }
  }
}

provider "dcnm" {
  # cisco-dcnm/ndfc user name
  username = var.ndfc_username
  # cisco-dcnm/ndfc password
  password = var.ndfc_password
  # cisco-dcnm/ndfc url
  url      = var.ndfc_url
  insecure = true
  platform = "nd"
}
