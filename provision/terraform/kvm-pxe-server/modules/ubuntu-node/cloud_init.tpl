#cloud-config
# vim: syntax=yaml
#
# ***********************
# 	---- for more examples look at: ------
# ---> https://cloudinit.readthedocs.io/en/latest/topics/examples.html
# ******************************
#
# This is the configuration syntax that the write_files module
# will know how to understand. encoding can be given b64 or gzip or (gz+b64).
# The content will be decoded accordingly and then written to the path that is
# provided.
#
# Note: Content strings here are truncated for example purposes.
hostname: ${hostname}

ssh_pwauth: True
chpasswd:
  list: |
     root:ubuntu
     ubuntu:ubuntu
  expire: False

users:
  - default
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdrAoF4x/zhfqtJrBJHpiQsxSTqkLMCe/sPRv/EXRWyrq5Q8wl5mbvsJ/IgpK6+0cfgqR5AQewtTabOCjOG4kqKwd5qzJguc2T/eQ06Pgfwb3BJgir9MiSF2bdeClaW54GO57of0eB0JrDWCpvY8DvhciaNgMKfSukxrOW2Czj3vquXH+TEG7FDNcnuG/ihyTZE2WVTnzMtt8qxWgWJsaDbNT5NYaoZblUjLsUI97q0jsOIldOpedjjdenT6jHYUKkFc71FUAbOPT9PIoXPVrbI5YCt4SBl6/oKvAsLbPP5ECiH2gviAtAtmyqSAEqQLgyjYPfGnS8ys8Icpgy044GP3dY7fg4O6h8iCUkvaP6/qi1qmlo7hj8cFdgARkIhc9vuORetAoy/VLY4VIq3Db0BgnIV1ddWW/HZcMPd20iuY7hGFmmLh5+8JI2iGjYYP7OSsccrAk1PHkqoCLxHfCDBR6rRnab4fg/tP3ZEHmyzMQcbeDqjwctzdO/uNSsLdU= jason@rig
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbqWE1b14Y49j3RBS4coWUR0Kd6GR6SFYWqkCwV1+h3fSeU3Xsrotp1Sh+kM91VnUoz1O5RbUF2Sc7HIYbPuwKjUwXu6hJOs4J7sTgQX9GY/3dHdiNo9Mpri8PWVTqwHa/BuGFgsj9jfEdRaVothKx2WE4M6WdxXYp81ofP1jODDbviIVtExWWzElo7eFpONtNnaBHey7R2a4zVRK7hE9ogryS66N3++OsO4mzIc3PTbIOVO2CIGG85RsYh5/eSpQfv9LkOztUX6SYQnYmKz3Vkmw3lDC5siCV5gnNlDTcHE9/dioNH7Kzy4e+hkaJsU8Xk8WZlXomeV+BOlWcYnLvrL0vcD66V/rHMlO1UUrWdpgqLTUVe5THgUUtAhlcYtCU8EqLNZQ5uIHJMVyKFSL4Ib2IeCAbl9GDYivXxSeviSJaZHVUvL1/t+I7Z52b5L/WnAh5jxO/niJtU3ejrmstPuhroKRKug0zLjX52FYAqug6XFZBWjeyLAA3MJ55rEk= jason@Jasons-MacBook-Pro.local