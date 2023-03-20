#! /bin/bash

# Get the pod name
export POD_NAME=$(kubectl get pods --namespace default -l "app=trino,release=trino,component=coordinator" -o jsonpath="{.items[0].metadata.name}")

echo $POD_NAME

# Setup connections
kubectl port-forward $POD_NAME 9090:8080 &
kubectl port-forward service/superset 8080:8088 &

echo "Press CTRL-C to stop port forwarding and exit the script"
wait
