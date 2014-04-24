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

Save following upstart-script into `/etc/init/teamspeak3.conf`

```
description     "Teamspeak 3 Server"
start on (net-device-up
          and local-filesystems
          and runlevel [2345])
stop on runlevel [016]

respawn

env USER=teamspeak3
env DIR=/home/teamspeak3/teamspeak3-server_linux-amd64
env BIN=ts3server_linux_amd64

script
cd $DIR
export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
exec su $USER -c "$DIR$BIN"
end script
```