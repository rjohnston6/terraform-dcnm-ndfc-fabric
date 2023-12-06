module "easy_fabric" {
  source = "rjohnston6/ndfc-fabric/dcnm"

  yaml_directory  = ["data"]
  fabric_template = "easy_fabric"
  fabric_name     = "tf-fabric"

}
