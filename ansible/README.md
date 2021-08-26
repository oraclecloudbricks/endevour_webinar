# Ejemplos Webinar Endevour - Ansible

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-linux-compute)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-linux-compute)


## Introduction

The following project shows a very simple example in how to run an orchestrated role using ansible. This orchestrated role is composed by two canonical roles where they: 
    - Installs a set of OS Packages
    - Creates a dummy OS user and group


## Important files

[run_playbook.sh](./run_playbook.sh)

Script that handles the execution of a playbook. This runs the command. `ansible-playbook playbook.yaml` triggering the execution of what's imperatively said on this file

---
[playbook.yaml](./playbook.yaml)

File that contains the set of roles that need to run on top of machines declared on file `ansible_hosts` In this case, the file looks like this: 

```yaml
# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# 
# Purpose: main playbook file 

- hosts: computes
  roles:
   - base_os_configurations
```

This means that what will be executed is the role `base_os_configurations` on top of all machines located on file `ansible_hosts` that have the tag `computes` associated to it

--- 
[ansible.cfg](./ansible.cfg)

This file contains the ansible configuration. In here, the name of the host file can be overloaded. The prescence of this file under this directory, will contextually force ansible to run on top of this directory as if it was it's own home directory. If not, this will default to out of the box ansible.cfg file. It's a good practice to host this file on your runtime environment. 

[ansible_hosts](./ansible_hosts)

Pivotal file for ansible correct behavior. This file contains the group tagging of the machines where the roles will run, along with specific variables assocaited to its execution. 
This file must contains the following structure

```shell
[machine_tag]
	hostname01 ansible_ssh_host=<hostname01_ip> ansible_ssh_port=22 ansible_ssh_user=opc
    hostname02 ansible_ssh_host=<hostname02_ip> ansible_ssh_port=22 ansible_ssh_user=opc
    

[machine_tag:vars]
	ansible_ssh_private_key_file = /full/path/to/private/key/associated/to/compute/and/user/opc/private_key
```


An example of this file below

```shell
[computes]
	lnxmachine01 ansible_ssh_host=10.0.0.81 ansible_ssh_port=22 ansible_ssh_user=opc
    lnxmachine02 ansible_ssh_host=10.0.1.195 ansible_ssh_port=22 ansible_ssh_user=opc

[computes:vars]
	ansible_ssh_private_key_file = /home/opc/REPOS/OCIFE/endevour_webinar/terraform/compute/ssh_keys/private_ssh_key
```

--
## Roles Directory
This directory contains all the roles that are ready to be ran on top of machines that match the conditions given on `ansible_host` and `playbook.yaml` files


[base_os_configurations](./roles/base_os_configurations/)

This directory contains the definition of the orchestrated role. This directory is meant to holster the files that put together a set of canonical roles in ordered execution. 

[lnx_add_dummy_user](./roles/lnx_add_dummy_user/)

This directory contains the definition of a canonical role that will create a dummy user and a dummy group

[lnx_osutils](./roles/lnx_osutils/)

This directory contains the definition of a canonical role that will install a set of OS Packages into each machine
## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](../LICENSE) for more details.
