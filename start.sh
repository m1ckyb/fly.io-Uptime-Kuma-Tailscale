#!/bin/sh

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=uptime
cd /root/uptime-kuma

if [ -z "$hc" ]
then
      echo "\$hc is NULL"
else
      echo "\$hc is NOT NULL"

    cat > /etc/periodic/15min/hc <<EOF
    curl -m 10 --retry 5 $hc
    EOF
    chmod +x /etc/periodic/15min/hc
fi

npm run setup
# Start Server
node server/server.js

