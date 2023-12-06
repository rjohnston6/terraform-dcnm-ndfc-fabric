<!-- BEGIN_TF_DOCS -->
# Terraform NDFC Fabric Module

**NOTICE:** *This module is under active development, the first fabric template to be included is the easy_fabric, additional templates will be added in the future.*

A Terraform module to create and update a fabric in NDFC. Due to the structure of the NDFC API delete or destory operations are not permitted. The goal is to allow the creation of the fabric as part of a Infrastructure as Code workflow.
Using a YAML document with the needed elements a fabric can be configured.

## Usage
By providing a directory of YAML files that define the configurations for the fabric settings are merged with the defaults to simplify the definitions required.
Users need only to define the fabric settings that they require and all other NDFC fabric template defaults are applied.

To see all available options the defaults for each fabric type are included in the defaults directory within the module repo [rjohnston6/terraform-dcnm-ndfc-fabric](https://github.com/rjohnston6/terraform-dcnm-ndfc-fabric/tree/main/defaults). Only the options that deviate from the defaults need to be declared.

## Examples
### New Easy Fabric
Example Directory structure for project
```bash
example/easy_fabric
├── data
│   └── fabric.yaml
├── example-directory-structure.md
├── main.tf
├── variables.tf
└── versions.tf

2 directories, 5 files
```

Configure a new Easy Fabric based fabric.

#### 'fabric.yaml'

```hcl
---
fabric:
  BGP_AS: "65013"
  GRFIELD_DEBUG_FLAG: "Enable"
```

#### 'main.tf'

```hcl
module "easy_fabric" {
  source = "rjohnston6/ndfc-fabric/dcnm"

  yaml_directory  = ["data"]
  fabric_template = "easy_fabric"
  fabric_name     = "tf-fabric"

}
```

## Acknowledgements

The module leverages efforts made by [Daniel Schmidt](https://github.com/danischm) and his Nexus-as-Code repo based for ACI [netascode/terraform-aci-nac-aci](https://github.com/netascode/terraform-aci-nac-aci). His work of using YAML as a data source and merging with default configurations streamlined and accelerated the capability to develop this NDFC module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dcnm"></a> [dcnm](#requirement\_dcnm) | 1.2.7 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | 0.2.5 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fabric_name"></a> [fabric\_name](#input\_fabric\_name) | n/a | `string` | n/a | yes |
| <a name="input_fabric_template"></a> [fabric\_template](#input\_fabric\_template) | Fabric Template Names, currently only easy\_fabric supported others to be added | `string` | `"easy_fabric"` | no |
| <a name="input_yaml_directory"></a> [yaml\_directory](#input\_yaml\_directory) | n/a | `list(string)` | <pre>[<br>  "data"<br>]</pre> | no |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dcnm"></a> [dcnm](#provider\_dcnm) | 1.2.7 |
| <a name="provider_utils"></a> [utils](#provider\_utils) | 0.2.5 |

## Resources

| Name | Type |
|------|------|
| [dcnm_rest.fabric](https://registry.terraform.io/providers/CiscoDevNet/dcnm/1.2.7/docs/resources/rest) | resource |
| [utils_yaml_merge.defaults](https://registry.terraform.io/providers/netascode/utils/0.2.5/docs/data-sources/yaml_merge) | data source |
| [utils_yaml_merge.model](https://registry.terraform.io/providers/netascode/utils/0.2.5/docs/data-sources/yaml_merge) | data source |
<!-- END_TF_DOCS -->