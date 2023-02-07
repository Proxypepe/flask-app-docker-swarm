#!/bin/bash


kubectl apply -f flask-secret.yaml
kubectl apply -f flask-deployment.yaml
kubectl apply -f flask-service.yaml
