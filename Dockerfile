FROM debian:9

WORKDIR /work
RUN apt-get update; apt-get install -yf curl bzip2 python-gnome2 dh-python libx11-6 libexpat1 libgl1-mesa-glx libglu1 freeglut3
RUN curl --remote-name-all https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb \
    https://download.foldingathome.org/releases/public/release/fahcontrol/debian-stable-64bit/v7.5/fahcontrol_7.5.1-1_all.deb \
    https://download.foldingathome.org/releases/public/release/fahviewer/debian-stable-64bit/v7.5/fahviewer_7.5.1_amd64.deb
COPY debconf .
RUN debconf-set-selections debconf
RUN dpkg -i *.deb

CMD ["/usr/bin/FAHClient", "--config", "/etc/fahclient/config.xml", "--http-addresses", "0.0.0.0:8080", "--allow", "0/0", "--web-allow", "0/0"]
VOLUME ["/work/cores"]
EXPOSE 8080
