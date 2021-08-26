# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment


######################################## PROVIDER SPECIFIC VARIABLES ######################################
region           = "re-region-1"
tenancy_ocid     = "ocid1.tenancy.oc1..foobar"
user_ocid        = "ocid1.user.oc1..foobar"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/foo/bar/path/oci_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
compute01_ssh_public_key                   = "./ssh_keys/public_ssh_key.pub"
compute01_ssh_private_key                  = "./ssh_keys/private_ssh_key"
compute01_ssh_public_is_path               = true
compute01_ssh_private_is_path              = true
compute01_compute_availability_domain_list = ["oDQF:sa-SANTIAGO-1-AD-1"]

compute01_network_subnet_name                     = "dalquint_hub_pub_subnet"
compute01_assign_public_ip_flag                   = true
compute01_fault_domain_name                       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
compute01_bkp_policy_boot_volume                  = "bronze"
compute01_linux_compute_instance_compartment_name = "ENDEVOUR_WEBINAR"
compute01_linux_compute_network_compartment_name  = "DALQUINT_HUB"
compute01_vcn_display_name                        = "DALQUINT_HUB_VCN"
compute01_num_instances                           = 2
compute01_is_nsg_required                         = false
compute01_compute_nsg_name                        = ""
compute01_compute_display_name_base               = "lnxmachine"
compute01_instance_image_ocid                     = "ocid1.image.oc1.sa-santiago-1.aaaaaaaa4wkfbnujci2u7tfm2eqhliuunxy2hwesmf5kwsclpamf4xgqs2wa" #Image: Oracle-Autonomous-Linux-7.9-2021.04-0
compute01_instance_shape                          = "VM.Standard.E4.Flex"
compute01_is_flex_shape                           = true
compute01_instance_shape_config_ocpus             = 1
compute01_instance_shape_config_memory_in_gbs     = 16
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
