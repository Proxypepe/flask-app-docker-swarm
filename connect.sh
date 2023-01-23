#!/bin/bash

container=$1

docker exec -it $(docker ps -q -f name=$container) sh
