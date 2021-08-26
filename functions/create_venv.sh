# Copyright (c) 2021 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# setup_env.sh 
#
# Purpose: Setup Python Virtual Environments to work with Functions

if [ "$#" -ne 1 ]; then
    echo "Missing system to create. Usage: ./create_venv.sh VIRTUAL_ENV_NAME"
else
    mkvirtualenv $1
fi