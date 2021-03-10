# No More Room in Hell Docker

docker run -d --name nmrih-server \
 -p 27015:27015 -p 27015:27015/udp -p 1200:1200 \
 -p 27005:27005/udp -p 27020:27020/udp -p 26901:26901/udp \
 -e SRV_HOSTNAME="My Server" \
 -e SRV_PASSWORD="" \
 -e RCON_PASSWORD=mypassword \
 no-more-room-in-hell

Credits to https://github.com/foxylion/docker-steam-css where I mostly copied the Dockerfile.

## Development

Build Image:

```sh
docker build . -t no-more-room-in-hell
```

Launch Interactive:

```sh
docker run -it --rm \
 -p 27015:27015 -p 27015:27015/udp -p 1200:1200 \
 -p 27005:27005/udp -p 27020:27020/udp -p 26901:26901/udp \
 no-more-room-in-hell /bin/bash
```
