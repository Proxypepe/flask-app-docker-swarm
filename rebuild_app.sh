#!/bin/bash
version=$1

if [[ -z $version ]]; then
	echo "Enter tag"
	exit 1
fi

docker build -t 127.0.0.1:5000/flask-app:$version src/
docker push 127.0.0.1:5000/flask-app:$version
sed -i "s/flask-app:.*/flask-app:${version}/" docker-compose-cp.yml
docker stack deploy -c docker-compose.yml apps

