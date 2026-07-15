FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV VNC_PORT=5901
ENV NOVNC_PORT=6080

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    tigervnc-standalone-server \
    tigervnc-common \
    novnc \
    websockify \
    supervisor \
    wget \
    curl \
    nano \
    sudo \
    pulseaudio \
    pulseaudio-utils \
    net-tools \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.vnc

COPY start.sh /start.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY pulse-client.conf /etc/pulse/client.conf

RUN chmod +x /start.sh

EXPOSE 5901
EXPOSE 6080

CMD ["/start.sh"]
