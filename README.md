[Dante](http://www.inet.no/dante/index.html) is a product developed by Inferno Nettverk A/S. It consists of a SOCKS server and a SOCKS client, implementing RFC 1928 and related standards. It is a flexible product that can be used to provide convenient and secure network connectivity.

This container contains the s6 overlay, so you can add additional initialization scripts. A minimal sockd.conf is also included. The contents of this file can be overridden by adding a volume mount to /etc/sockd.conf.

The container exposes a `WORKERS` environment variable that can be used to define the number of workers used (default: 4). 

## Usage

```
docker create \
  --name=dante \
  -p 1080:1080 \
  -v ./sockd.conf:/etc/sockd.conf \
  -e WORKERS=8 \
  mattberther/dante-server
```

### sockd.conf
```
logoutput: stdout
errorlog: stderr
internal: 0.0.0.0 port = 1080
external: eth0
socksmethod: username none
clientmethod: none
user.privileged: root
user.unprivileged: nobody

client pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    log: error
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    protocol: tcp udp
    log: error
}
```
