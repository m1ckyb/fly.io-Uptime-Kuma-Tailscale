#!/bin/sh

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=uptime
cd /root/uptime-kuma

if [ -z "$hc" ]
then
      echo "\$hc is NULL"
else
      echo "\$hc is NOT NULL"
      echo "#!/bin/sh"  >> /etc/periodic/15min/hc
      echo "curl -m 10 --retry 5 $hc" >> /etc/periodic/15min/hc
      chmod a+x /etc/periodic/15min/hc
      rc-status
      touch /run/openrc/softlevel
      rc-service crond start
fi

npm run setup
# Start Server
node server/server.js
