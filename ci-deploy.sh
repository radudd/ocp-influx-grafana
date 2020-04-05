#!/bin/bash

cat grafana-dashboard.json | jq .
python3 ci-deploy-gen-manifest.py

openssl aes-256-cbc -K $encrypted_c25bfdc08df8_key -iv $encrypted_c25bfdc08df8_iv -in kubeconfig.enc -out kubeconfig -d
oc apply -f grafana.json --config=kubeconfig
