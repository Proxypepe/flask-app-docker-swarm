#!/bin/bash


kubectl apply -f mysql-service.yaml
kubectl apply -f mysql-storage.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml
