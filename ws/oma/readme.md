# oma

# network

DNS is overriden, so you have to set it manually in resolved. You have to add to `/etc/systemd/network/20-x.network`

```
[DHCPv4]
RouteMetric=100
UseDomains=yes
```

