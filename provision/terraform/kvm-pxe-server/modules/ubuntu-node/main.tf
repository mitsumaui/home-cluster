terraform {
 required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}

# instance the provider
provider "libvirt" {
  uri = var.qemu_host
}

# We fetch the latest ubuntu release image from their mirrors
resource "libvirt_volume" "ubuntu-focal" {
  name   = "ubuntu-focal.qcow2"
  pool   = var.qemu_datastore
  source = "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "os" {
  name           = "${lower(var.vm_name)}-os.qcow2"
  base_volume_id = libvirt_volume.ubuntu-focal.id
  pool           = var.qemu_datastore
  size           = var.os_size_gb*1024*1024*1024
}

data "template_file" "cloudinit_data" {
  template = file("${path.module}/cloud_init.tpl")
    vars = {
    hostname = lower(var.vm_name)
  }
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.tpl")
  vars = {
    ip_address = var.ip_address
  }
}

# for more info about paramater check this out
# https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/website/docs/r/cloudinit.html.markdown
# Use CloudInit to add our ssh-key to the instance
# you can add also meta_data field
resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "${lower(var.vm_name)}-commoninit.iso"
  user_data      = data.template_file.cloudinit_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = var.qemu_datastore
}

# Create the machine
resource "libvirt_domain" "k8s" {
  name      = var.vm_name
  autostart = var.autostart
  memory    = var.mem_gb*1024
  vcpu      = var.num_cpu


  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    bridge = var.net_interface
  }

  # IMPORTANT: this is a known bug on cloud images, since they expect a console
  # we need to pass it
  # https://bugs.launchpad.net/cloud-images/+bug/1573095
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.os.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

# IPs: use wait_for_lease true or after creation use terraform refresh and terraform show for the ips of domain
