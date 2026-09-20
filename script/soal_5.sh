#!/bin/sh
# LAIN
cat <<EOF > /root/cek_status.sh
#!/bin/sh
ip -br a
iptables -t nat -L -v -n
EOF
chmod +x /root/cek_status.sh

# jalankan setelah reboot untuk membuktikan konfigurasi tidak hilang
/root/cek_status.sh
