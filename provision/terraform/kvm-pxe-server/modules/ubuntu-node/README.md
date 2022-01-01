# Terraform ubuntu-node Module

QEMU terraform module is available at [dmacvicar/terraform-provider-libvirt](https://github.com/dmacvicar/terraform-provider-libvirt)

This module will build out a QEMU VM based on parameters input. High level:
- Download Ubuntu Focal cloud image
- Creates OS volume
- Creates Data (Longhorn) volume
- Creates cloudinit template from cloud_init.tpl - injecting variables
- Creates network config template from network_config.tpl - injecting IP address
- Creates cloudinit ISO for injecting cloudinit
- Creates QEMU VM with all the above