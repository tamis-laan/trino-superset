#! /bin/bash

# Add Trino repository
helm repo add trino https://trinodb.github.io/charts

# Add Superset repository
helm repo add superset https://apache.github.io/superset

# Update helm
helm repo update

# Start cluster
kind create cluster --name trino

# Set context to Trino cluster
kubectl config set-context trino

# Install Trino
helm upgrade --cleanup-on-fail \
	--install trino trino/trino \
	--values trino.yaml

# Install superset
helm upgrade --cleanup-on-fail \
	--install superset superset/superset\
	--values superset.yaml

