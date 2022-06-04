#!/bin/sh

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=uptime
cd /root/uptime-kuma
npm run setup
# Start Server
node server/server.js
#pm2 start server/server.js --name uptime-kuma
