# teamspeak.mariouher.com

## Setup

Add user.

```sh
adduser ubuntu
adduser ubuntu sudo
```

Copy SSH key (run on local machine).

```sh
ssh-copy-id -i ~/.ssh/uherdotmarioatgmaildotcom ubuntu@teamspeak.mariouher.com
```

Allow user to sudo.

```sh
echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

Disable login for root.

```sh
echo "
PermitRootLogin no
AllowUsers ubuntu
" >> /etc/ssh/sshd_config
service ssh reload
```

Upgrade to latest updates.

```sh
sudo aptitude update
sudo aptitude safe-upgrade
sudo aptitude full-upgrade
```

Install teamspeak3.

```sh
wget http://dl.4players.de/ts/releases/3.0.10.3/teamspeak3-server_linux-amd64-3.0.10.3.tar.gz
tar -xzvf teamspeak3-server_linux*.tar.gz
rm teamspeak3-server_linux*.tar.gz
/home/ubuntu/teamspeak3-server_linux-amd64/ts3server_startscript.sh start
```

Copy `teamspeak3.conf` into `/etc/init/teamspeak3.conf`.


## Usage

```sh
ssh ubuntu@teamspeak.mariouher.com -i ~/.ssh/uherdotmarioatgmaildotcom

sudo [start|stop|restart] teamspeak3
```

Logs are stored in `/var/log/upstart/teamspeak3.conf`.
