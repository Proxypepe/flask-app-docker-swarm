#!/bin/bash

init_info=`docker swarm init`


if [[ $init_info == *"This node is already part of a swarm"* ]]; then
	echo "Part of swarm"
else 
	echo "Init docker swarm"
fi

echo "Set up a Docker registry"

running_containers=`docker service ls`


docker service create --name registry --publish published=5000,target=5000 registry:2

docker build -t 127.0.0.1:5000/flask-app:1 src/
docker push 127.0.0.1:5000/flask-app:1
sed -i "s/flask-app:.*/flask-app:1/" docker-compose.yml
docker stack deploy -c docker-compose.yml apps
