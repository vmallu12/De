# Ubuntu 24.04 + XFCE + TigerVNC + noVNC

A lightweight Ubuntu desktop accessible from your browser.

## Features

- Ubuntu 24.04 LTS
- XFCE Desktop
- TigerVNC Server
- noVNC Web Client
- Browser access
- Low RAM usage
- Docker compatible

## Build

```bash
docker build -t ubuntu-novnc .
```

## Run

```bash
docker run -d \
  --name ubuntu-desktop \
  -p 6080:6080 \
  -p 5901:5901 \
  ubuntu-novnc
```

## Access

Open your browser:

```
http://localhost:6080/vnc.html
```

Or on a VPS:

```
http://YOUR_SERVER_IP:6080/vnc.html
```

## Ports

- 6080 → noVNC (Web)
- 5901 → VNC

## Desktop

- XFCE

## Default User

```
root
```

## Stop

```bash
docker stop ubuntu-desktop
```

## Remove

```bash
docker rm -f ubuntu-desktop
```

## Rebuild

```bash
docker build --no-cache -t ubuntu-novnc .
```
