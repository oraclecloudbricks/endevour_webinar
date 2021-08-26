# Ejemplos Webinar Endevour - Kubernetes

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-linux-compute)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-linux-compute)


## Introduction

The following example implements a Kubernetes based Wordpress deployment, using MySQL PaaS service as backend database. In order to execute: 

- Create a Mounting Point. Make not of the Mount Point `ip address`
- Create a FSS attached to that mounting point. Make note of the `mounting point` if that FSS
- Create a MySQL Database with admin user named `root`. Make note of the `password` and the associated `ip address`

*Files to update* 

1. Update file [02_pv.yaml](./wordpress_on_k8/02_pv.yaml) passing on the `ip address` of the FSS Mount point into entry `server` and update the `mount point` under entry `path`
2. Go to file [kustomization](./wordpress_on_k8/06_wordpress_files/kustomization.yaml) and update the pertaining `password` for `root` user of MySQL and it's corresponding `ip address`. Both of them are under correspoding self explainatory `literals`


## Provisioning

- A wrapper script has been provisioned under file [create_wordpress.sh](./wordpress_on_k8/create_wordpress.sh) This script requires a pre-installed `kubectl` CLI and OCI CLI. Also a pre-created `kubeconfig` file. Please check on the demo videos under the [following link](https://www.youtube.com/playlist?list=PLd-kvneH6rZRkZT0KYJDsxwEaGrrIXyyq) to get a hold on how to create `kubeconfig` on your created cluster. 
- A script to setup your environment (bastion server) has been included under script [setup_bastion_server.sh](./../setup_bastion_server.sh). After running this script, complete the CLI Creation by following [this documentation](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingcredentials.htm#upload_key)

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](../LICENSE) for more details.
