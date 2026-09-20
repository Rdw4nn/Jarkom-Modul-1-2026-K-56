#!/bin/sh
# MIKA
apk add bind-tools    # supaya nslookup/dig tersedia di Alpine

cat <<'EOF' > /root/traffic_protocol7.sh
#!/bin/sh
echo "[*] Generating DNS & ICMP traffic..."
ping -c 5 8.8.8.8
nslookup google.com 8.8.8.8
echo "[*] Done."
EOF

chmod +x /root/traffic_protocol7.sh
