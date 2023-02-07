#!/bin/bash

url=$(minikube service flask-app-service --url)

curl "$url"



