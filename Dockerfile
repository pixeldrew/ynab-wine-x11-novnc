FROM solarkennedy/wine-x11-novnc-docker:latest

RUN apt-get update && apt-get -y install ca-certificates
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV WINEDEBUG -all

WORKDIR /root/
RUN mkdir -p /root/prefix32/drive_c
RUN wget -O - https://classic.youneedabudget.com/CDNOrigin/download/ynab4/liveCaptive/Win/YNAB%204_4.3.857_Setup.exe > /root/prefix32/drive_c/wnab-installer.exe
RUN /usr/bin/xvfb-run /usr/bin/wine "C:\wnab-installer.exe" /silent

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
