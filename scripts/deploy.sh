#!/bin/bash

echo "Creating namespaces..."
kubectl apply -f monitoring/namespace.yaml
kubectl apply -f logging/namespace.yaml

echo "Installing Prometheus stack..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install monitoring prometheus-community/kube-prometheus-stack \
  -n monitoring \
  -f monitoring/prometheus-values.yaml

echo "Deploying logging stack..."
kubectl apply -f logging/elasticsearch.yaml
kubectl apply -f logging/kibana.yaml
kubectl apply -f logging/fluentd-config.yaml
kubectl apply -f logging/fluentd.yaml

echo "Deployment complete!"
