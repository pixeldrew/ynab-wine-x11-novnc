FROM ubuntu:bionic

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /root/
RUN apt-get update && apt-get -y install software-properties-common wget
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN dpkg --add-architecture i386
RUN apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
RUN apt-get -y install xvfb x11vnc xdotool tar supervisor net-tools fluxbox winehq-stable winetricks

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV WINEPREFIX /root/prefix32
ENV WINEARCH win32
ENV DISPLAY :0
ENV WINDEBUG -all

RUN winetricks settings win8
RUN wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /root/ && mv /root/noVNC-1.1.0 /root/novnc && ln -s /root/novnc/vnc_lite.html /root/novnc/index.html
RUN wget -O - https://github.com/novnc/websockify/archive/v0.8.0.tar.gz | tar -xzv -C /root/ && mv /root/websockify-0.8.0 /root/novnc/utils/websockify
RUN wget -O - https://classic.youneedabudget.com/CDNOrigin/download/ynab4/liveCaptive/Win/YNAB%204_4.3.857_Setup.exe > /root/ynab-installer.exe
RUN /usr/bin/xvfb-run /usr/bin/wine ynab-installer.exe /silent

VOLUME /root/prefix32/drive_c/users/root
EXPOSE 8080

CMD ["/usr/bin/supervisord"]
