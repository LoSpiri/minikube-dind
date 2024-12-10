#!/bin/bash

echo "Ma che bel container marcondirondironder!"

start-docker.sh
docker load -i /tmp/minikube-image
minikube start --force
sleep 5s
minikube kubectl -- get pods -A
echo "alias kubectl=\"minikube kubectl --\"" >> ~/.bashrc
tail -f /dev/null