
# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# 04_create_certs.sh
#
# Purpose: Script that handles the creation of certificates and then pushes this into kubernetes in the form of a secret by using 

#!/bin/bash

kubectl delete secret tls-secret
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=nginxsvcendevour/O=nginxsvcendevour"
kubectl create secret tls tls-secret --key tls.key --cert tls.crt