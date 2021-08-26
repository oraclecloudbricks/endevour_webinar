# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# create_wordpress.sh
#
# Purpose: Script that handles the creation of wordpress entire orchestration

#!/bin/bash

echo '************* Running 01 *************'
kubectl delete -f 01_storage_class.yaml
echo '************* Running 02 *************'
kubectl delete -f 02_pv.yaml
echo '************* Running 03 *************'
kubectl delete -f 03_pvc.yaml
echo '************* Running 05 *************'
kubectl delete -f 05_ingress_RBAC.yaml
echo '************* Running 06 *************'
cd 06_wordpress_files
kubectl delete -k .
cd ..
echo '************* Running 07 *************'
kubectl delete -f 07_ingress_rule.yaml
