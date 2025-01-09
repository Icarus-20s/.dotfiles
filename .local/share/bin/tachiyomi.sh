#!/bin/env sh
sudo systemctl start docker
docker-compose -f /home/ayush/Docker/Tachidesk/docker-compose.yaml up -d
xdg-open http://localhost:4567/
