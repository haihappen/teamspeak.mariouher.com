# [teamspeak.mariouher.com](ts3server://teamspeak.mariouher.com)

```bash
docker-machine create --driver digitalocean --digitalocean-access-token TOKEN --digitalocean-region ams3 teamspeak.mariouher.com
docker-machine ssh teamspeak.mariouher.com mkdir -p /data/teamspeak/logs

$(docker-machine env teamspeak.mariouher.com)
docker build -t haihappen/teamspeak .
docker run -p=9987:9987/udp -p=10011:10011 -p=30033:30033 --name=teamspeak -v /data/teamspeak/logs:/data/teamspeak/logs haihappen/teamspeak
```
