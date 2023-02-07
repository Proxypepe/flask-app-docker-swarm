#!/bin/bash


./flask/start.sh
./mysql/start.sh

docker compose up -d
