# teamspeak.mariouher.com

## Setup

```sh
adduser ubuntu
su ubuntu
wget http://dl.4players.de/ts/releases/3.0.10.3/teamspeak3-server_linux-amd64-3.0.10.3.tar.gz
tar -xzvf teamspeak3-server_linux*.tar.gz
rm teamspeak3-server_linux*.tar.gz
/home/ubuntu/teamspeak3-server_linux-amd64/ts3server_startscript.sh start
```

Copy `teamspeak3.conf` into `/etc/init`.

## Usage

```sh
ssh ubuntu@teamspeak.mariouher.com -i ~/.ssh/uherdotmarioatgmaildotcom

[start|stop|restart] teamspeak3
```

Logs are stored in `/var/log/upstart/teamspeak3.conf`.
