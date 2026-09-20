#!/bin/sh
# MIKA
apk add ftp
ftp 192.239.2.2
# user: mika / mika123
# ftp> get protokol_tujuh.txt
# ftp> put file_baru.txt   -> harus muncul "550 Permission denied"
