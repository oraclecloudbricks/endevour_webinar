# Copyright (c) 2021 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# setup_env.sh 
#
# Purpose: Setup Environment to work with Oracle Functions

sudo yum -y install oracle-epel-release-el7
sudo yum -y install python36
pip3 install virtualenv --user opc
pip3 install virtualenvwrapper --user opc