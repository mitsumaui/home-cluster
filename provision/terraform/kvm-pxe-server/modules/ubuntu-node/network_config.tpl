version: 2
ethernets:
  ens3:
    dhcp4: false
    addresses:
    - ${ip_address}/24
    gateway4: 192.168.167.1
    nameservers:
      addresses:
      - 192.168.167.1
      search:
      - lan