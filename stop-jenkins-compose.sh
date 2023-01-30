#!/bin/bash

work_path=/var/lib/jenkins/workspace
docker_compose_file=docker-compose-jenkins.yml
project=$1

if [[ -z $project ]]; then
        echo 'Enter jenkins project name'
        exit 1
fi

project_path=$work_path/$project

if [[ -d $project_path ]]; then
        docker compose -f "$project_path"/$docker_compose_file down
        echo 'Worked'
else
        echo 'No such directory'
fi