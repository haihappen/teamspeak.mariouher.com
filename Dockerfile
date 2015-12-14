FROM ubuntu:14.04
MAINTAINER Mario Uher <uher.mario@gmail.com>

WORKDIR /data/teamspeak

RUN apt-get update && apt-get install -y curl

RUN curl -LO http://dl.4players.de/ts/releases/3.0.11.4/teamspeak3-server_linux-amd64-3.0.11.4.tar.gz \
 && tar --strip-components=1 -xvf teamspeak*.tar.gz \
 && rm teamspeak*.tar.gz

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

VOLUME ./logs
ENV LD_LIBRARY_PATH .
ENV LOGPATH ./logs

ENTRYPOINT ./ts3server_linux_amd64
