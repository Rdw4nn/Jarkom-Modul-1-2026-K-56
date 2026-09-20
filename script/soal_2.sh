#!/bin/sh
# LAIN
cat <<EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 192.239.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.239.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 192.239.3.1
    netmask 255.255.255.0
EOF

rc-service networking restart
ip -br a          # cek eth0 sudah dapat IP dari DHCP
ping -c3 8.8.8.8   # bukti Lain sudah punya akses internet
