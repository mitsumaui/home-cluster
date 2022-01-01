module "pxe_server" {
  source         = "./modules/ubuntu-node/"  
  qemu_host      = "qemu:///system"
  qemu_datastore = "FD-SSD"
  vm_name        = "pxe-server"
  mem_gb         = 2
  num_cpu        = 2
  autostart      = true
  net_interface  = "br0"
  ip_address     = "192.168.167.30"
  os_size_gb     = 20
}
