#!/bin/bash
set -e

export USER=root
export HOME=/root
export DISPLAY=:1

mkdir -p /run/dbus
mkdir -p /tmp/.X11-unix
chmod 1777 /tmp/.X11-unix

# Start D-Bus
dbus-daemon --system

# Configure VNC
mkdir -p /root/.vnc

cat > /root/.vnc/xstartup <<'EOF'
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

xrdb $HOME/.Xresources

export XDG_SESSION_DESKTOP=xfce
export XDG_CURRENT_DESKTOP=XFCE
export DESKTOP_SESSION=xfce

exec startxfce4
EOF

chmod +x /root/.vnc/xstartup

# Remove old lock files
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver -kill :1 >/dev/null 2>&1 || true

# Start TigerVNC
vncserver :1 \
    -geometry 1280x720 \
    -depth 24 \
    -localhost no \
    -SecurityTypes None

# Start noVNC
/usr/share/novnc/utils/novnc_proxy \
    --vnc localhost:5901 \
    --listen 6080
