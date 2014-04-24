# teamspeak.mariouher.com

## Setup

```sh
adduser teamspeak3
cd
wget http://dl.4players.de/ts/releases/3.0.10.3/teamspeak3-server_linux-amd64-3.0.10.3.tar.gz
tar -xzvf teamspeak3-server_linux*.tar.gz
rm teamspeak3-server_linux*.tar.gz
/home/teamspeak3/teamspeak3-server_linux-amd64/ts3server_startscript.sh start
```

## Upstart

Copy `teamspeak3.conf` into `/etc/init`.
