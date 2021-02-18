# Valheim Dedicated Server Docker Image

## Quickstart

Replace the values for `SERVER_NAME`, `WORLD_NAME`, and `SERVER_PASSWORD`. World data will be saved on a docker volume.

`docker run -d --restart unless-stopped --name valheim -p 2456-2458:2456-2458/udp -e SERVER_NAME=myserver -e WORLD_NAME=myworld -e SERVER_PASSWORD=mypassword palp/valheim_server`

## Using docker-compose with a filesystem mount

1. `git clone https://github.com/palp/valheim-server.git`
2. `cp env.sample .env`
3. Replace values in `.env`
4. Create data directory and allow write, ex. `mkdir ./data;chmod o+w ./data` 
4. `docker-compose up -d`
