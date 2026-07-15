#!/bin/bash
set -e

export USER=root
export HOME=/root
export DISPLAY=:1

# Start D-Bus
mkdir -p /run/dbus
dbus-daemon --system

# Runtime directory
export XDG_RUNTIME_DIR=/tmp/runtime-root
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"

# Configure VNC
mkdir -p /root/.vnc

cat > /root/.vnc/xstartup <<'EOF'
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

export XDG_SESSION_DESKTOP=xfce
export XDG_CURRENT_DESKTOP=XFCE
export DESKTOP_SESSION=xfce

xrdb $HOME/.Xresources 2>/dev/null || true

exec startxfce4
EOF

chmod +x /root/.vnc/xstartup

# Remove old VNC locks
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver -kill :1 >/dev/null 2>&1 || true

# Start TigerVNC
vncserver :1 \
    -geometry 1366x768 \
    -depth 24 \
    -localhost no \
    -SecurityTypes None

# Start noVNC
exec /usr/share/novnc/utils/novnc_proxy \
    --vnc localhost:5901 \
    --listen 6080
