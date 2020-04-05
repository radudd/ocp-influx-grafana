#!/bin/bash

# Validate grafana-dashboard
echo "## Validating Grafana dashboard YAML ##"
cat grafana-dashboard.json | jq .

# Install OC CLI

echo "## Installing OC CLI ##"
curl -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/oc/4.3/linux/oc.tar.gz 
sudo tar xzvf oc.tar.gz -C /usr/local/bin/ 
rm -f oc.tar.gz
