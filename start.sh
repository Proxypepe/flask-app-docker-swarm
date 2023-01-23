#!/bin/bash

init_info=$(docker swarm init)


if [[ $init_info == *"This node is already part of a swarm"* ]]; then
	echo "Part of swarm"
else 
	echo "Init docker swarm"
fi

echo "Set up a Docker registry"

docker service create --name registry --publish published=5000,target=5000 registry:2

db_password=$(docker secret ls | grep db_password)
db_root_password=$(docker secret ls | grep db_root_password)

if [[ -z "$db_password" && -z "$db_root_password" ]]; then
  echo "Creating new secrets for db passwords"
  openssl rand -base64 9 | docker secret create db_password -
  openssl rand -base64 9 | docker secret create db_root_password -
else
  echo "Secrets ok"
fi

openssl rand -base64 9 | docker secret create db_password -
openssl rand -base64 9 | docker secret create db_root_password -

docker build -t 127.0.0.1:5000/flask-app:1 src/
docker push 127.0.0.1:5000/flask-app:1
sed -i "s/flask-app:.*/flask-app:1/" docker-compose.yml
docker stack deploy -c docker-compose.yml apps
