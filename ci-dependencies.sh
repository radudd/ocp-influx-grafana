#!/bin/bash

# Validate grafana-dashboard
echo "## Validating Grafana dashboard YAML ##"
cat grafana-dashboard.json | jq . &>/dev/null || exit 99

# Install OC CLI

echo "## Installing OC CLI ##"
curl -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/oc/4.3/linux/oc.tar.gz &>/dev/null || exit 99
sudo tar xzvf oc.tar.gz -C /usr/local/bin/ || exit 99
rm -f oc.tar.gz 
