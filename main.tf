
locals {
  yaml_strings_directories = flatten([
    for dir in var.yaml_directory : [
      for file in fileset(".", "${dir}/*.{yml,yaml}") : file(file)
    ]
  ])
  fabric_settings = { "fabric" : try(yamldecode(data.utils_yaml_merge.model.output)["fabric"], {}) }
  fabric          = yamldecode(data.utils_yaml_merge.defaults.output)["fabric"]
  model           = yamldecode(data.utils_yaml_merge.model.output)

  fmt_fabric_template = join("_", [for s in split("_", var.fabric_template) : title(s)])
}

data "utils_yaml_merge" "model" {
  input = concat(local.yaml_strings_directories)
}

data "utils_yaml_merge" "defaults" {
  input = [file("${path.module}/defaults/${lower(var.fabric_template)}_defaults.yaml"), yamlencode(local.fabric_settings)]
}

resource "dcnm_rest" "fabric" {
  path    = "/appcenter/cisco/ndfc/api/v1/lan-fabric/rest/control/fabrics/${var.fabric_name}/${local.fmt_fabric_template}"
  payload = templatefile("${path.module}/templates/${lower(var.fabric_template)}.tftpl", local.fabric)

  lifecycle {
    prevent_destroy = true
  }
}
