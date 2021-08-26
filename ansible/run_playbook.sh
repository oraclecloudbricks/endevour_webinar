# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# 
# Purpose: Script that runs playbook and orchestrate the roles

#!/bin/sh
echo "--- Executing playbook"
ansible-playbook playbook.yaml 