#!/bin/sh
# CHISA
apk add busybox-extras
adduser phantom_user   # password: wired_ghost
telnetd -p 23 &

# EIRI
apk add busybox-extras
telnet 192.239.2.2
# login: phantom_user / wired_ghost
