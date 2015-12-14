#[teamspeak.mariouher.com](ts3server://teamspeak.mariouher.com)


## Requirements

Local requirements are docker and docker-machine. Both can be installed via [Homebrew](http://brew.sh):

```sh
brew install docker docker-machine
```

For production use some cloud server is needed, in this case [DigitalOcean](https://www.digitalocean.com).


## Installation

First setup the docker host, and create the logs directory:

```sh
docker-machine create --driver digitalocean --digitalocean-access-token TOKEN --digitalocean-region ams3 teamspeak.mariouher.com
docker-machine ssh teamspeak.mariouher.com mkdir -p /data/teamspeak/logs
```

Afterwards the docker image must be build and started on this host:

```sh
$(docker-machine env teamspeak.mariouher.com)
docker build -t haihappen/teamspeak .
docker run -p=9987:9987/udp -p=10011:10011 -p=30033:30033 --name=teamspeak -v /data/teamspeak:/data/teamspeak haihappen/teamspeak
```


## Updating

1. Rebuild the docker image and push it to back to GitHub. docker hub will then ran an automated build:

    ```sh
    docker build -t haihappen/teamspeak . # Test it locally
    git push origin
	```

3. Recreate the container:

   ```sh
   docker rm -f $(docker ps -qf name=teamspeak)
   docker run -p=9987:9987/udp -p=10011:10011 -p=30033:30033 --name=teamspeak -v /data/teamspeak:/data/teamspeak haihappen/teamspeak
   ```


## License (The MIT License)

Copyright (c) 2015 Mario Uher

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
