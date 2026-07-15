FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends  xfce4 tigervnc-standalone-server dbus-x11 supervisor wget curl python3-websockify novnc &&  apt-get clean && rm -rf /var/lib/apt/lists/*
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 6080 5901
CMD ["/start.sh"]
