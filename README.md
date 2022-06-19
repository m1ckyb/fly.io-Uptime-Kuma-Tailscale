# fly.io-Uptime-Kuma-Tailscale
fly.io Uptime Kuma with a Tailscale VPN 

```
flyctl secrets set TAILSCALE_AUTHKEY="tskey-***"
```

healthchecks.io Ping every 15 mins set
```
flyctl secrets set hc="https://hc-ping.com/****"
```
Launch 

```
flyctl launch
```
