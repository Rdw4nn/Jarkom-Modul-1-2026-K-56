#!/bin/sh
# LAIN
apk update && apk add iptables
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# jalankan di SETIAP client: Alice, Mika, Chisa, Knights, Eiri
echo "nameserver 8.8.8.8" > /etc/resolv.conf

ping -c3 8.8.8.8       # bukti internet mandiri
ping google.com
