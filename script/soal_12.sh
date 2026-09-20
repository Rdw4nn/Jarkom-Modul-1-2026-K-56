#!/bin/sh
# KNIGHTS — siapkan layanan agar port 22 & 80 terbuka, 7777 tertutup
rc-service sshd start
apk add python3
python3 -m http.server 80 &

# ALICE
nc -zv 192.239.3.2 22 80 7777
