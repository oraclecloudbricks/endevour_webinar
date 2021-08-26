# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# create_wordpress.sh
#
# Purpose: Script that handles the creation of wordpress entire orchestration

#!/bin/bash

echo '************* Running 01 *************'
kubectl apply -f 01_storage_class.yaml
echo '************* Running 02 *************'
kubectl apply -f 02_pv.yaml
echo '************* Running 03 *************'
kubectl apply -f 03_pvc.yaml
echo '************* Running 04 *************'
sh ./04_certificates/04_create_certs.sh
echo '************* Running 05 *************'
kubectl apply -f 05_ingress_RBAC.yaml
cd 06_wordpress_files
echo '************* Running 06 *************'
kubectl apply -k .
cd ..
echo '************* Sleeping for 2 minutes until LBaaS is created *************'
sleep 120
echo '************* Running 07 *************'
kubectl apply -f 07_ingress_rule.yaml
