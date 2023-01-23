#!/bin/bash


started_service=`docker service ls | grep apps`

if [[ $started_service == *"0/1"* ]]; then 
	echo "Service did not start yet"	
	exit 0
else 
	echo "Test result"
	curl 127.0.0.1:5001
fi

