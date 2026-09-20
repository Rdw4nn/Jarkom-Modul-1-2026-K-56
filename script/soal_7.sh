#!/bin/sh

# Update repository dan install FTP Server
apk update
apk add vsftpd

# Membuat user FTP
adduser alice
adduser mika
adduser eiri

# Membuat shared folder
mkdir -p /var/wired/data

# Alice sebagai pemilik folder
chown alice:alice /var/wired/data
chmod 755 /var/wired/data

# Membuat direktori konfigurasi per-user
mkdir -p /etc/vsftpd/user_conf

# Alice = Read & Write
cat <<EOF > /etc/vsftpd/user_conf/alice
local_root=/var/wired/data
write_enable=YES
EOF

# Mika = Read Only
cat <<EOF > /etc/vsftpd/user_conf/mika
local_root=/var/wired/data
write_enable=NO
EOF

# Whitelist user yang diperbolehkan login
# Eiri tidak dimasukkan sehingga akses FTP ditolak
cat <<EOF > /etc/vsftpd/user_list
alice
mika
EOF

# Konfigurasi utama VSFTPD
cat <<EOF > /etc/vsftpd/vsftpd.conf
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES

local_root=/var/wired/data

chroot_local_user=YES
allow_writeable_chroot=YES

pasv_enable=YES
pasv_min_port=30000
pasv_max_port=30100
pasv_promiscuous=YES

userlist_enable=YES
userlist_deny=NO
userlist_file=/etc/vsftpd/user_list

user_config_dir=/etc/vsftpd/user_conf
local_umask=022

seccomp_sandbox=NO
EOF

# Menjalankan FTP Server
killall vsftpd 2>/dev/null
vsftpd /etc/vsftpd/vsftpd.conf &

# Cek FTP Server pada port 21
busybox netstat -lnt | grep ':21'
