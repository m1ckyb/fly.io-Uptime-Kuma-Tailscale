# fly.io-Uptime-Kuma-Tailscale
fly.io Uptime Kuma with a Tailscale VPN (depreciated)

```
NO LONER WORKS WITH THE LATEST VERSION OF UPTIME-KUMA (DEPRECIATED)
```

```
flyctl secrets set TAILSCALE_AUTHKEY="tskey-***"
```

healthchecks.io Ping every 15 mins (optional, will ignore if not set)
```
flyctl secrets set hc="https://hc-ping.com/****"
```
Launch 

```
flyctl launch
```
