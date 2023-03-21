#! /bin/bash

# Setup connections
kubectl port-forward service/trino 9090:8080 &
kubectl port-forward service/superset 8080:8088 &

# Wait for input
echo "Press CTRL-C to stop port forwarding and exit the script"
wait
