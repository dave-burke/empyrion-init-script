#!/bin/bash

set -e

# Create user
addgroup --system --gid 1000 user
adduser --system --gid 1000 --uid 1000 --home /home/user user
mkdir -p /home/user/gamedir
chown -R $(id -u user):$(id -g user) /home/user/gamedir

# Install Docker
curl -fsSL https://get.docker.com | bash

# Run Empyrion
docker run -d -p 30000:30000/udp --user user --restart unless-stopped -v /home/user/gamedir:/home/user/Steam bitr/empyrion-server

