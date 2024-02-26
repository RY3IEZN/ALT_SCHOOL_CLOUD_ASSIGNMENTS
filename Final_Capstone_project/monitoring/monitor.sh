#! /bin/bash

# add prometheus to the helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# update helm repo
helm repo update

# install prometheus using helm
helm install prometheus prometheus-community/prometheus

# expose prometheus server by exposing the nodeport
# uncomment this line below ⬇
# kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-ext

# port-forward to view the prom server
# uncomment this line below ⬇
# kubectl port forward 


# add grafana to the helm repo
helm repo add grafana https://grafana.github.io/helm-charts

# update helm repo
helm repo update


# install grafana using helm
helm install grafana stable/grafana

# expose prometheus server by exposing the nodeport
# uncomment this line below ⬇
# kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext


# To get user name and password in Grafana:
# uncomment this line below ⬇
# kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
