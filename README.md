# Ubuntu 24.04 + XFCE + noVNC

A lightweight Ubuntu desktop running in Docker with browser access through noVNC.

## Features

- Ubuntu 24.04 LTS
- XFCE Desktop
- TigerVNC
- noVNC
- Websockify
- Docker Ready
- Low RAM Usage
- No VNC Password
- Browser Access

---

## Build

```bash
docker build -t ubuntu-desktop .
```

---

## Run

```bash
docker run -d \
  --name ubuntu-desktop \
  -p 6080:6080 \
  -p 5901:5901 \
  ubuntu-desktop
```

---

## Access

Open your browser:

```
http://localhost:6080/vnc.html
```

Or from another device:

```
http://YOUR_SERVER_IP:6080/vnc.html
```

---

## Ports

| Port | Description |
|------|-------------|
| 6080 | noVNC Web Interface |
| 5901 | TigerVNC |

---

## Desktop

XFCE

Resolution:

```
1366x768
```

Color Depth:

```
24-bit
```

---

## Stop

```bash
docker stop ubuntu-desktop
```

---

## Start

```bash
docker start ubuntu-desktop
```

---

## Remove

```bash
docker rm -f ubuntu-desktop
```

---

## Rebuild

```bash
docker build --no-cache -t ubuntu-desktop .
```
