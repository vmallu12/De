#!/bin/bash
mkdir -p ~/.vnc
cat > ~/.vnc/xstartup <<'EOF'
#!/bin/sh
exec startxfce4
EOF
chmod +x ~/.vnc/xstartup
vncserver :1 -geometry 1280x720 -depth 24 -SecurityTypes None -localhost no
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080
