# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# 
# Purpose: Script that creates infrastructure for example
#!/bin/sh

cd compute
terraform init 
terraform plan --var-file=system.tfvars
terraform destroy --var-file=system.tfvars --auto-approve