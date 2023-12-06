variable "yaml_directory" {
  type    = list(string)
  default = ["data"]
}

variable "fabric_template" {
  description = "Fabric Template Names, currently only easy_fabric supported others to be added"
  type        = string
  default     = "easy_fabric"

  validation {
    condition     = contains(["easy_fabric"], var.fabric_template)
    error_message = "Fabric Type must be one of the following \"easy_fabric\""
  }
}

variable "fabric_name" {
  type = string
}
