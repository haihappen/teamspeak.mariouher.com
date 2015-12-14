FROM ubuntu:14.04
MAINTAINER Mario Uher <uher.mario@gmail.com>

WORKDIR /data/teamspeak

COPY teamspeak*.tar.gz ./
RUN tar --strip-components=1 -xvf teamspeak*.tar.gz
RUN rm teamspeak*.tar.gz

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

VOLUME ./logs
ENV LD_LIBRARY_PATH .
ENV LOGPATH ./logs

CMD ./ts3server_linux_amd64
