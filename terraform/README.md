# Ejemplos Webinar Endevour - Terraform

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-linux-compute)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-linux-compute)


## Introduction

The following repository contains examples given at Oracle for Startups + Endevour Webinar. 

This particular example includes the usage of Cloud Bricks Project to provision a set of compute instances inside Oracle Cloud Infrastructure. In order to use this example, alter the file [system.tfvar](compute/system.tfvars) file with your own information as follows: 

```shell
######################################## PROVIDER SPECIFIC VARIABLES ######################################
region           = "re-region-1"
tenancy_ocid     = "ocid1.tenancy.oc1..foo"
user_ocid        = "ocid1.user.oc1..bar"
fingerprint      = "foo:bar:ba:foo:foo:bar"
private_key_path = "/foo/bar/path/oci_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
compute01_ssh_public_key                   = "./ssh_keys/public_ssh_key.pub"
compute01_ssh_private_key                  = "./ssh_keys/private_ssh_key"
compute01_ssh_public_is_path               = true
compute01_ssh_private_is_path              = true
compute01_compute_availability_domain_list = ["oDQF:re-region-1-AD-1"]

compute01_network_subnet_name                     = "compute_subnet"
compute01_assign_public_ip_flag                   = true
compute01_fault_domain_name                       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
compute01_bkp_policy_boot_volume                  = "bronze"
compute01_linux_compute_instance_compartment_name = "INSTANCE_COMPARTMENT"
compute01_linux_compute_network_compartment_name  = "NETWORK_COMPARTMENT"
compute01_vcn_display_name                        = "VCN_DISPLAY_NAME"
compute01_num_instances                           = 2
compute01_is_nsg_required                         = false
compute01_compute_nsg_name                        = ""
compute01_compute_display_name_base               = "lnxmachine"
compute01_instance_image_ocid                     = "ocid1.image.oc1.re-region-1.aaaaaaaa4wkfbnujci2u7tfm2eqhliuunxy2hwesmf5kwsclpamf4xgqs2wa" #Image: Oracle-Autonomous-Linux-7.9-2021.04-0
compute01_instance_shape                          = "VM.Standard.E4.Flex"
compute01_is_flex_shape                           = true
compute01_instance_shape_config_ocpus             = 1
compute01_instance_shape_config_memory_in_gbs     = 16
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
```

And alter file [backend.tf](compute/backend.tf)


For more information on how to use the framework, please refer to the following files: 

- [Cloud Bricks Examples Documentation](https://github.com/oracle-devrel/terraform-oci-cloudbricks-examples/blob/main/README.md)
- [Compute Backend Brick Documentation](https://github.com/oracle-devrel/terraform-oci-cloudbricks-linux-compute/blob/main/README.md)
## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](../LICENSE) for more details.
